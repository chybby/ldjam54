extends Node2D

const INFO_TEXT := "Must be defending the king from check"

signal satisfaction_changed(satisfied: bool)

@onready var dirt_particles: GPUParticles2D = %DirtParticles

var is_satisfied = null

const BlackKingPlant = preload("res://scenes/plant/black_king_plant/black_king_plant.gd")


func emit_dirt() -> void:
    dirt_particles.emitting = true
    dirt_particles.restart()


func plant(plant_position: Vector2i, tile_map: TerrariumTileMap) -> void:
    pass


func uproot(plant_position: Vector2i, tile_map: TerrariumTileMap) -> void:
    pass


func get_attacking_coords(plant_position: Vector2i, tile_map: TerrariumTileMap) -> Array[Vector2i]:
    var attacking_coords = [] as Array[Vector2i]
    for x in [-1, 0, 1]:
        for y in [-1, 0, 1]:
            if (x != 0) == (y != 0):
                continue
            var direction = Vector2i(x, y)
            var current_coord = plant_position + direction
            while tile_map.get_soil(current_coord) != null and tile_map.get_plant(current_coord) == null:
                attacking_coords.append(current_coord)
                current_coord += direction
            if tile_map.get_plant(current_coord) != null:
                # Attack the first plant we come across.
                attacking_coords.append(current_coord)
    return attacking_coords


func set_satisfied(satisfied: bool) -> bool:
    if is_satisfied != satisfied:
        satisfaction_changed.emit(satisfied)
    is_satisfied = satisfied
    return satisfied


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Black rook must be defending the black king from check.
    for x in tile_map.plants.size():
        for y in tile_map.plants[x].size():
            var plant = tile_map.plants[x][y]
            if plant is BlackKingPlant:
                # If king is in check we aren't defending. I mean we technically could be but w/e.
                if not plant.check_satisfied(Vector2i(x, y), tile_map):
                    return set_satisfied(false)
                # King is satisfied so it's not in check.
                # Remove the rook and see if the king is in check now.
                tile_map.plants[plant_position.x][plant_position.y] = null
                var king_in_check = not plant.check_satisfied_no_emit(Vector2i(x, y), tile_map)
                tile_map.plants[plant_position.x][plant_position.y] = self
                return set_satisfied(king_in_check)

    return set_satisfied(false)


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

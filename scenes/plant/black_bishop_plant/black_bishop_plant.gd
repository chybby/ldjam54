extends Node2D

const INFO_TEXT := "Only grows on wet soil"

signal satisfaction_changed(satisfied: bool)

@onready var dirt_particles: GPUParticles2D = %DirtParticles

var is_satisfied = null


func emit_dirt() -> void:
    dirt_particles.emitting = true
    dirt_particles.restart()


func plant(plant_position: Vector2i, tile_map: TerrariumTileMap) -> void:
    pass


func uproot(plant_position: Vector2i, tile_map: TerrariumTileMap) -> void:
    pass


func get_attacking_coords(plant_position: Vector2i, tile_map: TerrariumTileMap) -> Array[Vector2i]:
    var attacking_coords = [] as Array[Vector2i]
    for x in [-1, 1]:
        for y in [-1, 1]:
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
    # Black bishop is satisfied if on wet soil.
    return set_satisfied(tile_map.get_soil(plant_position) == tile_map.SOIL_WET)


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

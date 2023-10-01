extends Node2D

const INFO_TEXT := "Must not be in check"

signal satisfaction_changed(satisfied: bool)

@onready var dirt_particles: GPUParticles2D = %DirtParticles

var is_satisfied = null

const WhiteQueenPlant = preload("res://scenes/plant/white_queen_plant/white_queen_plant.gd")
const WhiteKingPlant = preload("res://scenes/plant/white_king_plant/white_king_plant.gd")
const WhiteBishopPlant = preload("res://scenes/plant/white_bishop_plant/white_bishop_plant.gd")
const WhiteRookPlant = preload("res://scenes/plant/white_rook_plant/white_rook_plant.gd")
const WhiteHonsePlant = preload("res://scenes/plant/white_honse_plant/white_honse_plant.gd")


func is_white_plant(plant) -> bool:
    if plant is WhiteQueenPlant:
        return true
    if plant is WhiteKingPlant:
        return true
    if plant is WhiteBishopPlant:
        return true
    if plant is WhiteRookPlant:
        return true
    if plant is WhiteHonsePlant:
        return true

    return false


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
            if x == 0 and y == 0:
                continue
            var current_coord = plant_position + Vector2i(x, y)
            if tile_map.get_soil(current_coord) != null:
                attacking_coords.append(current_coord)
    return attacking_coords


func set_satisfied(satisfied: bool) -> bool:
    if is_satisfied != satisfied:
        satisfaction_changed.emit(satisfied)
    is_satisfied = satisfied
    return satisfied


func check_satisfied_no_emit(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Black king is satisfied if not in check.
    for x in tile_map.plants.size():
        for y in tile_map.plants[x].size():
            var plant = tile_map.plants[x][y]
            if is_white_plant(plant):
                if plant_position in plant.get_attacking_coords(Vector2i(x, y), tile_map):
                    return false

    return true


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    return set_satisfied(check_satisfied_no_emit(plant_position, tile_map))


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

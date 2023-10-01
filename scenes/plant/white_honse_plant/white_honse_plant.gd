extends Node2D

const INFO_TEXT := "Must be threatening an enemy piece"

signal satisfaction_changed(satisfied: bool)

@onready var dirt_particles: GPUParticles2D = %DirtParticles

var is_satisfied = null

const BlackQueenPlant = preload("res://scenes/plant/black_queen_plant/black_queen_plant.gd")
const BlackKingPlant = preload("res://scenes/plant/black_king_plant/black_king_plant.gd")
const BlackBishopPlant = preload("res://scenes/plant/black_bishop_plant/black_bishop_plant.gd")
const BlackRookPlant = preload("res://scenes/plant/black_rook_plant/black_rook_plant.gd")
const BlackHonsePlant = preload("res://scenes/plant/black_honse_plant/black_honse_plant.gd")


func is_black_plant(plant) -> bool:
    if plant is BlackQueenPlant:
        return true
    if plant is BlackKingPlant:
        return true
    if plant is BlackBishopPlant:
        return true
    if plant is BlackRookPlant:
        return true
    if plant is BlackHonsePlant:
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
    var attacking_deltas = [
        Vector2i(-2, -1),
        Vector2i(-2, 1),
        Vector2i(2, -1),
        Vector2i(2, 1),
        Vector2i(-1, -2),
        Vector2i(-1, 2),
        Vector2i(1, -2),
        Vector2i(1, 2),
    ]
    for delta in attacking_deltas:
        var current_coord = plant_position + delta
        if tile_map.get_soil(current_coord) != null:
            attacking_coords.append(current_coord)
    return attacking_coords


func set_satisfied(satisfied: bool) -> bool:
    if is_satisfied != satisfied:
        satisfaction_changed.emit(satisfied)
    is_satisfied = satisfied
    return satisfied


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # White rook must be threatening an enemy piece.
    for coord in get_attacking_coords(plant_position, tile_map):
        if is_black_plant(tile_map.get_plant(coord)):
            return set_satisfied(true)

    return set_satisfied(false)


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

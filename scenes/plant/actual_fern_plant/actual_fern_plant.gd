extends Node2D

const INFO_TEXT := "Must be in a row or column filled with plants"

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


func set_satisfied(satisfied: bool) -> bool:
    if is_satisfied != satisfied:
        satisfaction_changed.emit(satisfied)
    is_satisfied = satisfied
    return satisfied


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Actual fern must be in a row or column filled with plants.
    var row_filled := true
    for coord in tile_map.get_row_coords(plant_position):
        if tile_map.get_soil(coord) != null and tile_map.get_obstacle(coord) == null and tile_map.get_plant(coord) == null:
            row_filled = false
            break

    var column_filled := true
    for coord in tile_map.get_column_coords(plant_position):
        if tile_map.get_soil(coord) != null and tile_map.get_obstacle(coord) == null and tile_map.get_plant(coord) == null:
            column_filled = false
            break

    return set_satisfied(row_filled or column_filled)


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

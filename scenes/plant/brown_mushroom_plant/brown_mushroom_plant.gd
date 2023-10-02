extends Node2D

const INFO_TEXT := "Turns soil in its column and row into wet soil"

signal satisfaction_changed(satisfied: bool)

@onready var dirt_particles: GPUParticles2D = %DirtParticles

var is_satisfied = null


func emit_dirt() -> void:
    dirt_particles.emitting = true
    dirt_particles.restart()


func plant(plant_position: Vector2i, tile_map: TerrariumTileMap) -> void:
    # Brown mushroom turns soil in its column/row into wet soil.
    var coords = tile_map.get_column_coords(plant_position, true)
    coords.append_array(tile_map.get_row_coords(plant_position, false))
    for coord in coords:
        var soil_id = tile_map.get_soil(coord)
        if soil_id != null:
            tile_map.add_modification(self, coord, tile_map.SOIL_WET)


func uproot(plant_position: Vector2i, tile_map: TerrariumTileMap) -> void:
    pass


func set_satisfied(satisfied: bool) -> bool:
    if is_satisfied != satisfied:
        satisfaction_changed.emit(satisfied)
    is_satisfied = satisfied
    return satisfied


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Brown mushroom is satisfied always.
    return set_satisfied(true)


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

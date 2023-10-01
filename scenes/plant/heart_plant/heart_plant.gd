extends Node2D

const INFO_TEXT := "Needs to be between exactly two other plants"

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
    # Heart is satisfied if it's between exactly two other plants.
    var surrounding_plants_coords = []
    for coord in tile_map.get_surrounding_coords(plant_position):
        var plant = tile_map.get_plant(coord)
        if plant != null:
            surrounding_plants_coords.append(coord)

    if surrounding_plants_coords.size() != 2:
        return set_satisfied(false)

    var plant1 = surrounding_plants_coords[0] as Vector2i
    var plant2 = surrounding_plants_coords[1] as Vector2i

    if ((plant1.x == plant_position.x and plant2.x == plant_position.x)
        or (plant1.y == plant_position.y and plant2.y == plant_position.y)):
        return set_satisfied(true)

    if (plant1 - plant2).length_squared() == 8:
        return set_satisfied(true)

    return set_satisfied(false)


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

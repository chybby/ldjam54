extends Node2D

const INFO_TEXT := "Needs to be next to water"

signal satisfaction_changed(satisfied: bool)

@onready var dirt_particles: GPUParticles2D = %DirtParticles

var is_satisfied = null

func emit_dirt() -> void:
    dirt_particles.emitting = true
    dirt_particles.restart()

func set_satisfied(satisfied: bool) -> bool:
    if is_satisfied != satisfied:
        satisfaction_changed.emit(satisfied)
    is_satisfied = satisfied
    return satisfied


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Bamboo is satisfied if next to water.
    for coord in tile_map.get_surrounding_coords(plant_position):
        if tile_map.get_obstacle(coord) == tile_map.OBSTACLE_WATER:
            return set_satisfied(true)

    return set_satisfied(false)


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

extends Node2D

const INFO_TEXT := "Needs to be on soil"

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


# Plant ideas:
# Needs to be next to X other plants.
# Can't be next to another plant.
# Can't be on the edge.
# Needs to be next to all other plants of the same type.
# Needs to be on specific soil.
# Needs to be the only plant in its row and/or column.
# Needs to be in a filled column/row.
# Needs to (not) be next to a rock.
# Needs to be on the edge/corner/middle.
# King plant needs to not be in check from the queen plant.


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Grass is satisfied if on normal soil.
    return set_satisfied(tile_map.get_soil(plant_position) == tile_map.SOIL_NORMAL)


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

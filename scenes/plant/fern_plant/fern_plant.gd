extends Node2D

const INFO_TEXT := "Can't be next to a rock"

signal satisfaction_changed(satisfied: bool)

var is_satisfied = null


func set_satisfied(satisfied: bool) -> bool:
    if is_satisfied != satisfied:
        satisfaction_changed.emit(satisfied)
    is_satisfied = satisfied
    return satisfied


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Fern is satisfied if not next to a rock.
    for coord in tile_map.get_surrounding_coords(plant_position):
        if tile_map.get_obstacle(coord) == tile_map.OBSTACLE_ROCK:
            return set_satisfied(false)

    return set_satisfied(true)


func _on_area_2d_mouse_entered():
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    GameEvents.emit_plant_area_exited()

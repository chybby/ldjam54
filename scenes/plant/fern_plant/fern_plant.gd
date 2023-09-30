extends Node2D

var is_satisfied := false
const info_text := "Needs a rock"

func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # For now, fern plant is satisfied if next to a rock.
    for coord in tile_map.get_surrounding_coords(plant_position):
        if tile_map.get_obstacle(coord) == tile_map.OBSTACLE_ROCK:
            is_satisfied = true
            return true

    is_satisfied = false
    return false

func _on_area_2d_mouse_entered():
    print("fern entered")
    GameEvents.emit_plant_area_entered(info_text)
    
func _on_area_2d_mouse_exited():
    print("fern exited")
    GameEvents.emit_plant_area_exited()

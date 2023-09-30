extends Node2D

var is_satisfied := false
const info_text := "Needs an edge"


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # For example, sprig is satisfied if it's at the edge of the terrarium.
    for coord in tile_map.get_surrounding_coords(plant_position):
        if tile_map.get_soil(coord) == null:
            is_satisfied = true
            return true

    is_satisfied = false
    return false

func _on_area_2d_mouse_entered():
    print("spring entered")
    GameEvents.emit_plant_area_entered(info_text)

func _on_area_2d_mouse_exited():
    print("sprig exited")
    GameEvents.emit_plant_area_exited()

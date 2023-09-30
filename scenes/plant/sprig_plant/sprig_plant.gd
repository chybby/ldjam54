extends Node2D

var is_satisfied := false


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # For example, sprig is satisfied if it's at the edge of the terrarium.
    for coord in tile_map.get_surrounding_coords(plant_position):
        if tile_map.get_soil(coord) == null:
            is_satisfied = true
            return true

    is_satisfied = false
    return false

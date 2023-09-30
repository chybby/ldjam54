extends Node2D

var is_satisfied := true


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Grass is satisfied always.
    return true

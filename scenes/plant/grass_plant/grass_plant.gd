extends Node2D

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
#

var is_satisfied := true


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Grass is satisfied always.
    return true

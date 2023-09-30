extends Node2D

@export var tile_map: TerrariumTileMap
@export var plant_pots: Array[PlantPot]


func _ready() -> void:
    tile_map.state_changed.connect(on_tile_map_state_changed)


func is_level_complete() -> bool:
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return false

    if not held_item_manager.is_empty():
        return false

    for plant_pot in plant_pots:
        if not plant_pot.is_empty():
            return false

    return tile_map.are_all_plants_satisfied()


func on_tile_map_state_changed() -> void:
    if is_level_complete():
        print("level complete!")

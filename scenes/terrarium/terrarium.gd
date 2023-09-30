extends Node2D

const SOIL_LAYER = 0
const OBSTACLE_LAYER = 1

@export var size := Vector2i(4, 3)

@onready var tile_map: TileMap = %TileMap

# Nested Array of Node2D.
var plants: Array


func _ready() -> void:
    plants = []
    for x in size.x:
        var column = []
        for y in size.y:
            column.append(null)
        plants.append(column)

    print(plants)


func get_clicked_cell_coords(position: Vector2):
    var coords = tile_map.local_to_map(tile_map.to_local(position))
    if tile_map.get_cell_tile_data(SOIL_LAYER, coords) == null:
        return null
    return coords


func get_plant_at_coords(coords: Vector2i):
    if plants == null:
        return null

    return plants[coords.x][coords.y]


func get_soil_at_coords(coords: Vector2i):
    var tile_data = tile_map.get_cell_tile_data(SOIL_LAYER, coords)
    if tile_data == null:
        return null
    return tile_data.get_custom_data("soil_id")


func get_obstacle_at_coords(coords: Vector2i):
    var tile_data = tile_map.get_cell_tile_data(OBSTACLE_LAYER, coords)
    if tile_data == null:
        return null
    return tile_data.get_custom_data("obstacle_id")


func handle_click(coords: Vector2i) -> void:
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return

    print("Soil at click is %s" % get_soil_at_coords(coords))
    print("Obstacle at click is %s" % get_obstacle_at_coords(coords))
    print("Plant at click is %s" % get_plant_at_coords(coords))

    if held_item_manager.held_item == null && get_plant_at_coords(coords) != null:
        var plant = plants[coords.x][coords.y] as Node2D
        held_item_manager.hold_item(plant)
        plants[coords.x][coords.y] = null
    elif held_item_manager.held_item != null && get_plant_at_coords(coords) == null && get_obstacle_at_coords(coords) == null:
        var plant = held_item_manager.release_item()
        plants[coords.x][coords.y] = plant
        add_child(plant)
        plant.position = tile_map.map_to_local(coords)


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("click"):
        var coords = get_clicked_cell_coords(event.position)
        if coords != null:
            handle_click(coords)

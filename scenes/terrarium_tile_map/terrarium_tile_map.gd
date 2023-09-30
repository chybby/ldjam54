extends TileMap
class_name TerrariumTileMap

signal state_changed

const SOIL_LAYER = 0
const SOIL_SAND = 0
const SOIL_NORMAL = 1
const SOIL_WET = 2

const OBSTACLE_LAYER = 1
const OBSTACLE_ROCK = 0

# Nested Array of Node2D.
var plants: Array


func _ready() -> void:
    # This is the size of every used tile of the tilemap.
    # Not every tile is necessarily soil.
    var size = calculate_size()
    print("Calculated size: %s" % size)

    plants = []
    for x in size.x:
        var column = []
        for y in size.y:
            column.append(null)
        plants.append(column)


func calculate_size() -> Vector2i:
    return get_used_rect().end


func get_clicked_cell_coords(click_position: Vector2):
    var coords = local_to_map(to_local(click_position))
    if get_cell_tile_data(SOIL_LAYER, coords) == null:
        return null
    return coords


func get_plant(coords: Vector2i):
    if plants == null:
        return null

    return plants[coords.x][coords.y]


func get_soil(coords: Vector2i):
    var tile_data = get_cell_tile_data(SOIL_LAYER, coords)
    if tile_data == null:
        return null
    return tile_data.get_custom_data("soil_id")


func get_obstacle(coords: Vector2i):
    var tile_data = get_cell_tile_data(OBSTACLE_LAYER, coords)
    if tile_data == null:
        return null
    return tile_data.get_custom_data("obstacle_id")


# Need to make sure update_plants has been called before this.
func are_all_plants_satisfied() -> bool:
    for column in plants:
        for plant in column:
            if plant != null:
                if not plant.is_satisfied:
                    return false

    return true


func update_plants() -> void:
    for x in plants.size():
        for y in plants[x].size():
            var plant = plants[x][y]
            if plant == null:
                continue
            var coords = Vector2i(x, y)
            plant.check_satisfied(coords, self)
            print("%s at %s satisfied? %s" % [plant, coords, plant.is_satisfied])


func get_surrounding_coords(coord: Vector2i, include_center: bool = false) -> Array[Vector2i]:
    var coords = [] as Array[Vector2i]
    for x in [-1, 0, 1]:
        for y in [-1, 0, 1]:
            if not include_center and x == 0 and y == 0:
                continue
            var delta = Vector2i(x, y)
            coords.append(coord + delta)

    return coords


func place_plant(plant: Node2D, coords: Vector2i) -> void:
    plants[coords.x][coords.y] = plant
    add_child(plant)
    plant.global_position = to_global(map_to_local(coords))
    update_plants()


func uproot_plant(coords: Vector2i) -> Node2D:
    var plant = plants[coords.x][coords.y] as Node2D
    plants[coords.x][coords.y] = null
    update_plants()
    return plant


func handle_click(coords: Vector2i) -> void:
    print("click")
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return

#    print("Soil at %s is %s" % [coords, get_soil(coords)])
#    print("Obstacle at %s is %s" % [coords, get_obstacle(coords)])
#    print("Plant at %s is %s" % [coords, get_plant(coords)])

    # TODO: swap held and clicked plants?
    if held_item_manager.held_item == null && get_plant(coords) != null:
        held_item_manager.hold_item(uproot_plant(coords))
        # This needs to happen after the held_item_manager is updated.
        state_changed.emit()
    elif held_item_manager.held_item != null && get_plant(coords) == null && get_obstacle(coords) == null:
        place_plant(held_item_manager.release_item(), coords)
        state_changed.emit()


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("click"):
        var coords = get_clicked_cell_coords(event.position)
        if coords != null:
            handle_click(coords)

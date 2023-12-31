extends TileMap
class_name TerrariumTileMap

signal state_changed

const DEFAULT_SOURCE = 0

const SOIL_LAYER = 2
const SOIL_SAND = 0
const SOIL_SAND_ATLAS = Vector2i(0, 0)
const SOIL_NORMAL = 1
const SOIL_NORMAL_ATLAS = Vector2i(1, 0)
const SOIL_WET = 2
const SOIL_WET_ATLAS = Vector2i(2, 0)

const OBSTACLE_LAYER = 3
const OBSTACLE_ROCK = 0
const OBSTACLE_WATER = 1

const CURSOR_LAYER = 4
const CURSOR_ATLAS = Vector2i(9, 0)

# Nested Array of Node2D.
var plants: Array
var plant_order: Array[Node2D]

var size: Vector2i

# Nested Array of Node2D.
var original_soils: Array
# Dict from Node2D to nested Array of Node2D.
var modifications = {}


func _ready() -> void:
    # This is the size of every used tile of the tilemap.
    # Not every tile is necessarily soil.
    size = calculate_size()
    print("Calculated size: %s" % size)

    # Set up plants.
    plants = []
    for x in size.x:
        var column = []
        for y in size.y:
            column.append(null)
        plants.append(column)

    # Set up original soils.
    original_soils = []
    for x in size.x:
        var column = []
        for y in size.y:
            column.append(get_soil(Vector2i(x, y)))
        original_soils.append(column)


func calculate_size() -> Vector2i:
    return get_used_rect().end


func get_cell_coords(at_position: Vector2):
    var coords = local_to_map(to_local(at_position))
    if get_cell_tile_data(SOIL_LAYER, coords) == null:
        return null
    return coords


func get_plant(coords: Vector2i):
    if plants == null:
        return null

    return plants[coords.x][coords.y]


func soil_id_to_atlas(soil_id: int) -> Vector2i:
    match soil_id:
        SOIL_SAND:
            return SOIL_SAND_ATLAS
        SOIL_NORMAL:
            return SOIL_NORMAL_ATLAS
        SOIL_WET:
            return SOIL_WET_ATLAS

    return Vector2i(-1, -1)


func get_soil(coords: Vector2i):
    var tile_data = get_cell_tile_data(SOIL_LAYER, coords)
    if tile_data == null:
        return null
    return tile_data.get_custom_data("soil_id")


func add_modification(plant: Node2D, coords: Vector2i, soil_id: int):
    if not modifications.has(plant):
        var plant_mods = []
        for x in size.x:
            var column = []
            for y in size.y:
                column.append(null)
            plant_mods.append(column)

        modifications[plant] = plant_mods

    modifications[plant][coords.x][coords.y] = soil_id


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
    # Reset soils.
    for x in original_soils.size():
        for y in original_soils[x].size():
            if original_soils[x][y] != null:
                set_cell(SOIL_LAYER, Vector2i(x, y), DEFAULT_SOURCE, soil_id_to_atlas(original_soils[x][y]))

    # Apply modifications in order.
    for plant in plant_order:
        if modifications.has(plant):
            var plant_mods = modifications[plant]
            for x in plant_mods.size():
                for y in plant_mods[x].size():
                    if plant_mods[x][y] != null:
                        set_cell(SOIL_LAYER, Vector2i(x, y), DEFAULT_SOURCE, soil_id_to_atlas(plant_mods[x][y]))

    # Check if plants satisfied.
    for x in plants.size():
        for y in plants[x].size():
            var plant = plants[x][y]
            if plant == null:
                continue
            var coords = Vector2i(x, y)
            plant.check_satisfied(coords, self)
            print("%s at %s satisfied? %s" % [plant, coords, plant.is_satisfied])


func get_column_coords(coord: Vector2i, include_self: bool = false) -> Array[Vector2i]:
    var coords = [] as Array[Vector2i]
    for y in size.y:
        if not include_self and y == coord.y:
            continue
        coords.append(Vector2i(coord.x, y))
    return coords


func get_row_coords(coord: Vector2i, include_self: bool = false) -> Array[Vector2i]:
    var coords = [] as Array[Vector2i]
    for x in size.x:
        if not include_self and x == coord.x:
            continue
        coords.append(Vector2i(x, coord.y))
    return coords


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
    plant_order.append(plant)
    add_child(plant)
    plant.global_position = to_global(map_to_local(coords))
    plant.plant(coords, self)
    update_plants()


func uproot_plant(coords: Vector2i) -> Node2D:
    var plant = plants[coords.x][coords.y] as Node2D
    plants[coords.x][coords.y] = null
    plant_order.erase(plant)
    # Don't emit the particles.
    plant.is_satisfied = null
    plant.uproot(coords, self)
    modifications.erase(plant)
    update_plants()
    return plant


func handle_click(coords: Vector2i) -> void:
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return

#    print("Soil at %s is %s" % [coords, get_soil(coords)])
#    print("Obstacle at %s is %s" % [coords, get_obstacle(coords)])
#    print("Plant at %s is %s" % [coords, get_plant(coords)])

    if held_item_manager.held_item == null and get_plant(coords) != null:
        # Uprooting a plant.
        var plant = uproot_plant(coords)
        plant.emit_dirt()
        held_item_manager.hold_item(plant)
        # This needs to happen after the held_item_manager is updated.
        state_changed.emit()
    elif held_item_manager.held_item != null and get_plant(coords) == null && get_obstacle(coords) == null:
        # Planting a plant.
        place_plant(held_item_manager.release_item(), coords)
        state_changed.emit()
    elif held_item_manager.held_item != null and get_plant(coords) != null:
        # Swapping plants.
        var uprooted_plant = uproot_plant(coords)
        uprooted_plant.emit_dirt()
        place_plant(held_item_manager.release_item(), coords)
        held_item_manager.hold_item(uprooted_plant)
        GameEvents.emit_plant_swapped(uprooted_plant.INFO_TEXT)
        state_changed.emit()


func handle_hover(coords: Vector2i) -> void:
    if get_soil(coords) != null:
        set_cell(CURSOR_LAYER, coords, DEFAULT_SOURCE, CURSOR_ATLAS)


func disable_input() -> void:
    set_process_input(false)
    clear_layer(CURSOR_LAYER)


func _input(event: InputEvent) -> void:
    if event.is_action_pressed("click"):
        var coords = get_cell_coords(event.position)
        if coords != null:
            handle_click(coords)
    elif event is InputEventMouseMotion:
        clear_layer(CURSOR_LAYER)
        var coords = get_cell_coords(event.position)
        if coords != null:
            handle_hover(coords)


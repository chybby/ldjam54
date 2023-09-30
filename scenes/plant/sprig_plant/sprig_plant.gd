extends Node2D

const INFO_TEXT := "Needs an empty column and row"

signal satisfaction_changed(satisfied: bool)

var is_satisfied = null


func set_satisfied(satisfied: bool) -> bool:
    if is_satisfied != satisfied:
        satisfaction_changed.emit(satisfied)
    is_satisfied = satisfied
    return satisfied


func check_satisfied(plant_position: Vector2i, tile_map: TerrariumTileMap) -> bool:
    # Sprig is satisfied if it's the only plant in its row/column.
    for coord in tile_map.get_column_coords(plant_position):
        if tile_map.get_plant(coord) != null:
            return set_satisfied(false)

    for coord in tile_map.get_row_coords(plant_position):
        if tile_map.get_plant(coord) != null:
            return set_satisfied(false)

    return set_satisfied(true)


func _on_area_2d_mouse_entered():
    print("spring entered")
    GameEvents.emit_plant_area_entered(INFO_TEXT)


func _on_area_2d_mouse_exited():
    print("sprig exited")
    GameEvents.emit_plant_area_exited()

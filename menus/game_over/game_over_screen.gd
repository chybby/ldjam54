extends CanvasLayer

@onready var restart_button: MarginContainer = %RestartButton
@onready var quit_button: MarginContainer = %QuitButton
@onready var terrarium_tile_map: TileMap = %TerrariumTileMap


func _ready() -> void:
    terrarium_tile_map.set_process_input(false)
    restart_button.pressed.connect(on_restart_button_pressed)
    quit_button.pressed.connect(on_quit_button_pressed)


func on_restart_button_pressed() -> void:
    ScreenTransition.transition_to_scene_file("res://menus/main_menu/main_menu_screen.tscn")


func on_quit_button_pressed() -> void:
    ScreenTransition.transition_then(func():
        get_tree().quit()
    )

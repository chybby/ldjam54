extends CanvasLayer

@onready var play_button: MarginContainer = %PlayButton
@onready var level_select_button: MarginContainer = %LevelSelectButton
@onready var level_select: CanvasLayer = %LevelSelect
@onready var game_start_ui: MarginContainer = %GameStartUI
@onready var settings_button: MarginContainer = %SettingsButton
@onready var settings: CanvasLayer = %Settings
@onready var terrarium_tile_map: TileMap = %TerrariumTileMap


func _ready() -> void:
    terrarium_tile_map.set_process_input(false)
    play_button.pressed.connect(on_play_button_pressed)
    level_select_button.pressed.connect(on_level_select_button_pressed)
    settings_button.pressed.connect(on_settings_button_pressed)
    MusicManager.add_music(%Audio)


func on_play_button_pressed() -> void:
    ScreenTransition.transition_to_scene_file("res://main/main.tscn")


func on_level_select_button_pressed() -> void:
    ScreenTransition.transition_then(func():
        level_select.visible = true
        game_start_ui.visible = false
        await level_select.closed
        level_select.visible = false
        game_start_ui.visible = true
    )


func on_settings_button_pressed() -> void:
    settings.enable_disable()

extends CanvasLayer

@onready var play_button: MarginContainer = %PlayButton
@onready var level_select_button: MarginContainer = %LevelSelectButton
@onready var level_select: CanvasLayer = %LevelSelect
@onready var game_start_ui: MarginContainer = %GameStartUI


func _ready() -> void:
    play_button.pressed.connect(on_play_button_pressed)
    level_select_button.pressed.connect(on_level_select_button_pressed)
    MusicManager.add_music("res://menus/main_menu/menu_music.mp3")


func on_play_button_pressed() -> void:
    ScreenTransition.transition_to_scene_file("res://main/main.tscn")


func on_level_select_button_pressed() -> void:
    level_select.visible = true
    game_start_ui.visible = false
    await level_select.closed
    level_select.visible = false
    game_start_ui.visible = true


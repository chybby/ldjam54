extends CanvasLayer

@onready var play_button: MarginContainer = %PlayButton
@onready var settings_button: MarginContainer = %SettingsButton
@onready var settings: CanvasLayer = %Settings
@onready var game_start_ui: MarginContainer = %GameStartUI

func _ready() -> void:
    play_button.pressed.connect(on_play_button_pressed)
    settings_button.pressed.connect(on_settings_button_pressed)
    MusicManager.add_music(%Audio)


func on_play_button_pressed() -> void:
    ScreenTransition.transition_to_scene("res://main/main.tscn")

func on_settings_button_pressed() -> void:
    settings.exited.connect(reset_menu)
    settings.visible = true
    game_start_ui.visible = false

func reset_menu() -> void:
    settings.visible = false
    game_start_ui.visible = true

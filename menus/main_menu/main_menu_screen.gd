extends CanvasLayer

@onready var play_button: MarginContainer = %PlayButton

func _ready() -> void:
    play_button.pressed.connect(on_play_button_pressed)
    MusicManager.add_music("res://menus/main_menu/menu_music.mp3")


func on_play_button_pressed() -> void:
    ScreenTransition.transition_to_scene("res://main/main.tscn")

func on_settings_button_pressed() -> void:
    %Settings.visible = true
    %GameStartUI.visible = false

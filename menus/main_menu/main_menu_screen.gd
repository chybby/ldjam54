extends CanvasLayer

@onready var start_button: Button = %StartButton

func _ready() -> void:
    start_button.pressed.connect(on_start_button_pressed)
    MusicManager.add_music("res://menus/main_menu/menu_music.mp3")


func on_start_button_pressed() -> void:
    ScreenTransition.transition_to_scene("res://main/main.tscn")

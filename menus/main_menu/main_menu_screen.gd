extends CanvasLayer

@onready var play_button: MarginContainer = %PlayButton


func _ready() -> void:
    play_button.pressed.connect(on_play_button_pressed)


func on_play_button_pressed() -> void:
    ScreenTransition.transition_to_scene("res://main/main.tscn")

extends CanvasLayer

@onready var restart_button: MarginContainer = %RestartButton
@onready var quit_button: MarginContainer = %QuitButton


func _ready() -> void:
    restart_button.pressed.connect(on_restart_button_pressed)
    quit_button.pressed.connect(on_quit_button_pressed)


func on_restart_button_pressed() -> void:
    ScreenTransition.transition_to_scene("res://menus/main_menu/main_menu_screen.tscn")


func on_quit_button_pressed() -> void:
    ScreenTransition.transition()
    await ScreenTransition.transitioned_halfway
    get_tree().quit()

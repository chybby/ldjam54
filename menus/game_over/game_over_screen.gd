extends CanvasLayer

@onready var restart_button: Button = %RestartButton
@onready var quit_button: Button = %QuitButton


func _ready() -> void:
    restart_button.pressed.connect(on_restart_button_pressed)
    quit_button.pressed.connect(on_quit_button_pressed)


func on_restart_button_pressed() -> void:
    get_tree().change_scene_to_file("res://menus/main_menu/main_menu_screen.tscn")


func on_quit_button_pressed() -> void:
    get_tree().quit()

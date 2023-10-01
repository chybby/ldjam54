extends CanvasLayer

signal exited
@export var enable_keyboard = true

@onready var main_menu_button: MarginContainer = %MainMenuButton
@onready var animation_player: AnimationPlayer = %AnimationPlayer


func _ready() -> void:
    main_menu_button.pressed.connect(on_main_menu_button_pressed)
    if not enable_keyboard:
        main_menu_button.queue_free()


func _input(event):
    if not enable_keyboard:
        return
    if event.is_action_pressed("pause"):
        enable_disable()


func enable_disable() -> void:
    if visible:
        # Blur out.
        animation_player.play_backwards("blur")
        await animation_player.animation_finished
        exited.emit()
    else:
        # Blur in.
        animation_player.play("blur")
    get_tree().paused = not get_tree().paused
    visible = not visible


func _on_volume_value_changed(volume):
    AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), volume)


func _on_exit_button_pressed():
    enable_disable()


func on_main_menu_button_pressed() -> void:
    ScreenTransition.transition_to_scene_file("res://menus/main_menu/main_menu_screen.tscn")

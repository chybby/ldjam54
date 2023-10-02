extends CanvasLayer

signal closed

@onready var levels: VBoxContainer = %Levels
@onready var exit_button: MarginContainer = %ExitButton

@export var first_level_scene: PackedScene

var level_item_scene := preload("res://menus/level_select/level_item.tscn")


func _ready() -> void:
    exit_button.pressed.connect(on_exit_button_pressed)

    var level_scene = first_level_scene
    var level_number = 1
    while level_scene != null:
        var level_item_instance = level_item_scene.instantiate()
        levels.add_child(level_item_instance)

        var level_instance = level_scene.instantiate()
        level_item_instance.set_level(level_scene, level_instance.level_name, level_number)
        level_scene = level_instance.next_level_scene
        level_number += 1


func on_exit_button_pressed() -> void:
    ScreenTransition.transition_then(func():
        visible = false
        closed.emit()
    )


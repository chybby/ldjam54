extends Node2D

@export var first_level_scene: PackedScene

@onready var level: Node2D = %Level
@onready var hud: CanvasLayer = %HUD

var level_number := 1


func _ready() -> void:
    MusicManager.add_music(%Audio)
    load_level(first_level_scene)


func load_level(level_scene: PackedScene):
    hud.reset()
    for child in level.get_children():
        child.queue_free()
    var level_instance = level_scene.instantiate()
    level.add_child(level_instance)
    level_instance.level_complete.connect(on_level_complete)
    level_instance.end_game.connect(on_end_game)
    hud.set_level_name(level_instance.level_name, level_number)
    level_number += 1


func disable_terrarium_input() -> void:
    var terrarium = get_tree().get_first_node_in_group("terrarium")
    if terrarium != null:
        terrarium.disable_input()


func on_end_game() -> void:
    disable_terrarium_input()
    hud.show_next_level_button()
    await hud.next_level_button_pressed
    ScreenTransition.transition_to_scene_file("res://menus/game_over/game_over_screen.tscn")


func on_level_complete(next_level_scene: PackedScene) -> void:
    disable_terrarium_input()
    hud.show_next_level_button()
    await hud.next_level_button_pressed
    ScreenTransition.transition_then(func():
        load_level(next_level_scene)
    )

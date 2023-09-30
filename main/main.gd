extends Node2D

@export var first_level_scene: PackedScene

@onready var level: Node2D = %Level
@onready var hud: Control = %HUD


func _ready() -> void:
    load_level(first_level_scene)


func load_level(level_scene: PackedScene):
    hud.reset()
    for child in level.get_children():
        child.queue_free()
    var level_instance = level_scene.instantiate()
    level.add_child(level_instance)
    level_instance.load_next_level.connect(on_load_next_level)
    level_instance.end_game.connect(on_end_game)


func on_end_game() -> void:
    ScreenTransition.transition_to_scene("res://menus/game_over/game_over_screen.tscn")


func on_load_next_level(level_scene: PackedScene) -> void:
    ScreenTransition.transition()
    await ScreenTransition.transitioned_halfway
    load_level(level_scene)

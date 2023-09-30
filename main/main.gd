extends Node2D

@export var first_level_scene: PackedScene

@onready var level: Node2D = %Level


func _ready() -> void:
    load_level(first_level_scene)


func load_level(level_scene: PackedScene):
    for child in level.get_children():
        child.queue_free()
    var level_instance = level_scene.instantiate()
    level.add_child(level_instance)
    level_instance.load_next_level.connect(on_load_next_level)
    level_instance.end_game.connect(on_end_game)


func on_end_game() -> void:
    # TODO
    print("Game finished!")


func on_load_next_level(level_scene: PackedScene) -> void:
    load_level(level_scene)

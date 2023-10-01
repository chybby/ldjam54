extends Node2D

@export var first_level_scene: PackedScene

@onready var level: Node2D = %Level
@onready var hud: CanvasLayer = %HUD


func _ready() -> void:
    load_level(first_level_scene)


func load_level(level_scene: PackedScene):
    hud.reset()
    for child in level.get_children():
        child.queue_free()
    var level_instance = level_scene.instantiate()
    level.add_child(level_instance)
    level_instance.level_complete.connect(on_level_complete)
    level_instance.end_game.connect(on_end_game)


func on_end_game() -> void:
    hud.show_next_level_button()
    await hud.next_level_button_pressed
    ScreenTransition.transition_to_scene("res://menus/game_over/game_over_screen.tscn")


func on_level_complete(next_level_scene: PackedScene) -> void:
    hud.show_next_level_button()
    await hud.next_level_button_pressed
    ScreenTransition.transition()
    await ScreenTransition.transitioned_halfway
    load_level(next_level_scene)

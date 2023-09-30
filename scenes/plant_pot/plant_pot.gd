@tool
extends Node2D
class_name PlantPot

@export var initial_plant_scene: PackedScene

@onready var area_2d: Area2D = %Area2D
@onready var plant_position: Node2D = %PlantPosition

var mouse_over := false
var plant: Node2D


func _ready() -> void:
    area_2d.mouse_entered.connect(on_mouse_entered.bind(true))
    area_2d.mouse_exited.connect(on_mouse_entered.bind(false))

    if initial_plant_scene != null:
        plant = initial_plant_scene.instantiate()
        add_plant(plant)


func is_empty() -> bool:
    return plant == null


func add_plant(new_plant: Node2D) -> void:
    plant_position.add_child(new_plant)
    new_plant.position = Vector2.ZERO


func handle_click() -> void:
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return

    # TODO: swap held and clicked plants?
    if held_item_manager.held_item == null and plant != null:
        held_item_manager.hold_item(plant)
        plant.emit_dirt()
        plant = null
    elif held_item_manager.held_item != null and plant == null:
        plant = held_item_manager.release_item()
        add_plant(plant)


func _input(event: InputEvent) -> void:
    if mouse_over && event.is_action_pressed("click"):
        handle_click()


func on_mouse_entered(entered: bool) -> void:
    mouse_over = entered

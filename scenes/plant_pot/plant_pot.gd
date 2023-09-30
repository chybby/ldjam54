extends Node2D

@export var plant_scene: PackedScene

@onready var area_2d: Area2D = %Area2D
@onready var plant_position: Marker2D = %PlantPosition

var mouse_over := false
var plant: Node2D


func _ready() -> void:
    area_2d.mouse_entered.connect(on_mouse_entered.bind(true))
    area_2d.mouse_exited.connect(on_mouse_entered.bind(false))

    plant = plant_scene.instantiate()
    add_child(plant)
    plant.position = plant_position.position


func handle_click() -> void:
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager == null:
        return

    if held_item_manager.held_item == null and plant != null:
        held_item_manager.hold_item(plant)
        plant = null
    elif held_item_manager.held_item != null and plant == null:
        plant = held_item_manager.release_item()
        add_child(plant)
        plant.position = plant_position.position


func _input(event: InputEvent) -> void:
    if mouse_over && event.is_action_pressed("click"):
        handle_click()


func on_mouse_entered(entered: bool) -> void:
    mouse_over = entered

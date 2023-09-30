extends Node

var held_item: Node2D


func _input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        if held_item != null:
            held_item.global_position = event.position


func is_empty() -> bool:
    return held_item == null


func hold_item(item: Node2D) -> void:
    held_item = item
    item.get_parent().remove_child(item)
    add_child(item)
    item.global_position = get_viewport().get_mouse_position()


func release_item() -> Node2D:
    remove_child(held_item)
    var item = held_item
    held_item = null
    return item

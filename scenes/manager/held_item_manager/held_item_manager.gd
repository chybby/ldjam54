extends Node2D

var held_item: Node2D
@onready var place_sound := preload("res://assets/place_sound1.mp3")
@onready var uproot_sound := preload("res://assets/uproot_sound1.mp3")
@onready var audio := %Audio

func _input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        if held_item != null:
            held_item.global_position = event.position


func is_empty() -> bool:
    return held_item == null


func hold_item(item: Node2D) -> void:
    CursorManager.set_cursor(CursorManager.GRABBING)
    held_item = item
    item.get_parent().remove_child(item)
    add_child(item)
    item.global_position = get_viewport().get_mouse_position()
    audio.stream = uproot_sound
    audio.play()


func release_item() -> Node2D:
    CursorManager.set_cursor(CursorManager.POINTING)
    remove_child(held_item)
    var item = held_item
    held_item = null
    audio.stream = place_sound
    audio.play()
    return item

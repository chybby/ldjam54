extends Node

const POINTING := 0
const CAN_GRAB := 1
const GRABBING := 2

@export var cursor_textures: Array[Texture]

var current_cursor = 0
var cursor_size = null


func _ready() -> void:
    get_viewport().size_changed.connect(on_viewport_size_changed)
    on_viewport_size_changed()


func get_cursor() -> int:
    return current_cursor


func set_cursor(id: int) -> void:
    if id == current_cursor:
        return
    current_cursor = id
    match id:
        POINTING:
            Input.set_default_cursor_shape(Input.CURSOR_ARROW)
        CAN_GRAB:
            Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
        GRABBING:
            Input.set_default_cursor_shape(Input.CURSOR_DRAG)


func on_viewport_size_changed() -> void:
    var old_cursor_size = cursor_size
    var display_size = get_viewport().get_screen_transform().get_scale() * Vector2(get_viewport().content_scale_size)
    var display_width = display_size.x

    if display_width > 2000:
        cursor_size = 2
    elif display_width > 1000:
        cursor_size = 1
    else:
        cursor_size = 0

    if cursor_size != old_cursor_size:
        print("Cursor size is now %d" % cursor_size)
        Input.set_custom_mouse_cursor(cursor_textures[POINTING * 3 + cursor_size], Input.CURSOR_ARROW, Vector2(0, 0))
        Input.set_custom_mouse_cursor(cursor_textures[CAN_GRAB * 3 + cursor_size], Input.CURSOR_POINTING_HAND, Vector2(0, 0))
        Input.set_custom_mouse_cursor(cursor_textures[GRABBING * 3 + cursor_size], Input.CURSOR_DRAG, Vector2(0, 0))

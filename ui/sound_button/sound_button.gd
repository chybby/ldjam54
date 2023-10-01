@tool
extends MarginContainer

signal pressed

@export_multiline var text: String = ""
@export var icon: Texture = null

@onready var button: Button = %Button
@onready var label: Label = %Label
@onready var margin_container: MarginContainer = %MarginContainer


var initial_label_position: Vector2


func _ready() -> void:
    button.pressed.connect(on_button_pressed)
    button.icon = icon
    label.text = text
    # Sure.
    await get_tree().process_frame
    initial_label_position = label.position


func _process(delta: float) -> void:
    if button.get_draw_mode() == Button.DRAW_PRESSED:
        label.position = initial_label_position + Vector2.ONE
    else:
        label.position = initial_label_position


func on_button_pressed() -> void:
    pressed.emit()

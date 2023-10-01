@tool
extends MarginContainer

signal pressed

@export_multiline var text: String = ""
@export var icon: Texture = null

@onready var button: Button = %Button
@onready var label: Label = %Label
@onready var margin_container: MarginContainer = %MarginContainer
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer


var initial_label_position: Vector2
var label_position_settled := false


func _ready() -> void:
    button.pressed.connect(on_button_pressed)
    button.icon = icon
    label.text = text
    # Sure.
    get_tree().process_frame.connect(on_layout)


func _process(delta: float) -> void:
    if initial_label_position == null:
        return
    if button.get_draw_mode() == Button.DRAW_PRESSED:
        label.position = initial_label_position + Vector2.ONE
    else:
        label.position = initial_label_position


func on_button_pressed() -> void:
    audio_stream_player.play()
    pressed.emit()


func on_layout() -> void:
    if initial_label_position == label.position:
        label_position_settled = true

    if label_position_settled:
        return

    initial_label_position = label.position

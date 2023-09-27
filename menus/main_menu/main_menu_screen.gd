extends CanvasLayer

@onready var label := %Label

func on_button_pressed() -> void:
    label.text = "You pressed the button!"

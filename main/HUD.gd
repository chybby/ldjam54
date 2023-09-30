extends Control

@export var tooltip: Label
var next_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
    GameEvents.plant_area_interacted.connect(set_tooltip)
    pass

func set_tooltip(text):
    # Can't set text to other text until text is cleared so queue it up.
    if tooltip.text != "" and text != "":
        next_text = text
    if text == "" and next_text != "":
        tooltip.text = next_text
        next_text = ""
    else:
        tooltip.text = text

func reset():
    tooltip.text = ""
    next_text = ""

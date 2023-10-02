extends CanvasLayer

signal next_level_button_pressed

@onready var tooltip: Label = %Tooltip
@onready var tooltip_container: PanelContainer = %TooltipContainer
@onready var next_level_button: MarginContainer = %NextLevelButton
@onready var level_name: Label = %LevelName


var next_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
    GameEvents.plant_area_interacted.connect(set_tooltip)
    next_level_button.pressed.connect(on_next_level_button_pressed)


func show_next_level_button() -> void:
    next_level_button.visible = true


func set_level_name(level_name: String, level_number: int) -> void:
    self.level_name.text = "%d      %s" % [level_number, level_name]


func set_tooltip(text):
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager != null and not held_item_manager.is_empty():
        return

    # Can't set text to other text until text is cleared so queue it up.
    if tooltip.text != "" and text != "":
        next_text = text
    if text == "" and next_text != "":
        tooltip.text = next_text
        next_text = ""
    else:
        tooltip.text = text

    tooltip_container.visible = tooltip.text != ""


func reset():
    tooltip_container.visible = false
    next_level_button.visible = false
    tooltip.text = ""
    next_text = ""


func on_next_level_button_pressed() -> void:
    next_level_button_pressed.emit()

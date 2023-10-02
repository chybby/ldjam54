extends CanvasLayer

signal next_level_button_pressed

@onready var tooltip: Label = %Tooltip
@onready var tooltip_container: MarginContainer = %TooltipContainer
@onready var next_level_button: MarginContainer = %NextLevelButton
@onready var level_name: Label = %LevelName
@onready var level_name_container: PanelContainer = %LevelNameContainer

var target_tooltip_text := ""
var next_text := ""

var tooltip_original_position: Vector2
var next_level_button_original_position = null

var tooltip_tween: Tween


func _ready():
    GameEvents.plant_area_interacted.connect(set_tooltip)
    next_level_button.pressed.connect(on_next_level_button_pressed)

    await get_tree().process_frame
    tooltip_original_position = tooltip_container.position
    next_level_button_original_position = next_level_button.position

    var tween = create_tween()
    tween.tween_property(tooltip_container, "position", tooltip_original_position + Vector2.DOWN * 30, 0.0)
    tween.tween_property(next_level_button, "position", next_level_button_original_position + Vector2.DOWN * 30, 0.0)


func show_next_level_button() -> void:
    var tween = create_tween()
    tween.tween_property(next_level_button, "position", next_level_button_original_position, 0.5)\
        .set_ease(Tween.EASE_OUT)\
        .set_trans(Tween.TRANS_BACK)


func set_level_name(level_name: String, level_number: int) -> void:
    self.level_name.text = "%d      %s" % [level_number, level_name]

    await get_tree().process_frame
    var tween = create_tween()
    tween.tween_property(level_name_container, "position", level_name_container.position + Vector2.UP * 30, 0.0)
    tween.tween_property(level_name_container, "position", level_name_container.position, 0.5)\
        .set_ease(Tween.EASE_OUT)\
        .set_trans(Tween.TRANS_BACK)\
        .set_delay(0.5)


func set_tooltip(text: String):
    var held_item_manager = get_tree().get_first_node_in_group("held_item_manager")
    if held_item_manager != null and not held_item_manager.is_empty():
        return

    # Can't set text to other text until text is cleared so queue it up.
    if target_tooltip_text != "" and text != "":
        next_text = text
    if text == "" and next_text != "":
        target_tooltip_text = next_text
        next_text = ""
    else:
        target_tooltip_text = text

    if tooltip_tween != null and tooltip_tween.is_valid():
        tooltip_tween.stop()

    if target_tooltip_text == "":
        tooltip_tween = create_tween()
        tooltip_tween.tween_property(tooltip_container, "position", tooltip_original_position + Vector2.DOWN * 30, 0.5)\
            .set_ease(Tween.EASE_OUT)\
            .set_trans(Tween.TRANS_BACK)
        tooltip_tween.tween_callback(func():
            tooltip.text = target_tooltip_text
        )
    else:
        tooltip.text = target_tooltip_text
        tooltip_tween = create_tween()
        tooltip_tween.tween_property(tooltip_container, "position", tooltip_original_position, 0.5)\
            .set_ease(Tween.EASE_OUT)\
            .set_trans(Tween.TRANS_BACK)


func reset():
    tooltip.text = ""
    next_text = ""
    if next_level_button_original_position != null:
        var tween = create_tween()
        tween.tween_property(next_level_button, "position", next_level_button_original_position + Vector2.DOWN * 30, 0.0)


func on_next_level_button_pressed() -> void:
    next_level_button_pressed.emit()

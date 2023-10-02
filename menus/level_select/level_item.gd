extends PanelContainer

@export var main_scene: PackedScene

@onready var level_name: Label = %LevelName
@onready var play_button: MarginContainer = %PlayButton

var level_scene: PackedScene


func _ready() -> void:
    play_button.pressed.connect(on_play_button_pressed)


func set_level(level_scene: PackedScene, level_name: String) -> void:
    self.level_scene = level_scene
    self.level_name.text = level_name


func on_play_button_pressed() -> void:
    var main_instance = main_scene.instantiate()
    main_instance.first_level_scene = level_scene
    ScreenTransition.transition_to_scene(main_instance)

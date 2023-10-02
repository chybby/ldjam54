extends CanvasLayer

signal transitioned_halfway

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var color_rect: ColorRect = %ColorRect


func emit_halfway() -> void:
    transitioned_halfway.emit()


func transition_to_scene_file(scene_file: String) -> void:
    color_rect.mouse_filter = Control.MOUSE_FILTER_STOP
    get_tree().paused = true
    transition()
    await transitioned_halfway
    color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
    get_tree().paused = false
    get_tree().change_scene_to_file(scene_file)


func transition_to_packed_scene(scene: PackedScene) -> void:
    color_rect.mouse_filter = Control.MOUSE_FILTER_STOP
    get_tree().paused = true
    transition()
    await transitioned_halfway
    color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
    get_tree().paused = false
    get_tree().change_scene_to_packed(scene)


func transition_to_scene(scene: Node) -> void:
    var packed_scene = PackedScene.new()
    packed_scene.pack(scene)
    transition_to_packed_scene(packed_scene)


func transition_then(callback: Callable) -> void:
    color_rect.mouse_filter = Control.MOUSE_FILTER_STOP
    get_tree().paused = true
    transition()
    await transitioned_halfway
    color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
    get_tree().paused = false
    callback.call()


func transition() -> void:
    animation_player.stop()
    animation_player.play("default")

extends CanvasLayer

signal transitioned_halfway

@onready var animation_player: AnimationPlayer = %AnimationPlayer


func emit_halfway() -> void:
    transitioned_halfway.emit()


func transition_to_scene_file(scene_file: String) -> void:
    get_tree().paused = true
    transition()
    await transitioned_halfway
    get_tree().paused = false
    get_tree().change_scene_to_file(scene_file)


func transition_to_packed_scene(scene: PackedScene) -> void:
    get_tree().paused = true
    transition()
    await transitioned_halfway
    get_tree().paused = false
    get_tree().change_scene_to_packed(scene)


func transition_to_scene(scene: Node) -> void:
    var packed_scene = PackedScene.new()
    packed_scene.pack(scene)
    transition_to_packed_scene(packed_scene)


func transition_then(callback: Callable) -> void:
    get_tree().paused = true
    transition()
    await transitioned_halfway
    get_tree().paused = false
    callback.call()


func transition() -> void:
    animation_player.stop()
    animation_player.play("default")

extends CanvasLayer

signal transitioned_halfway

@onready var animation_player: AnimationPlayer = %AnimationPlayer


func emit_halfway() -> void:
    transitioned_halfway.emit()


func transition_to_scene_file(scene_file: String) -> void:
    transition()
    await transitioned_halfway
    get_tree().change_scene_to_file(scene_file)


func transition_to_packed_scene(scene: PackedScene) -> void:
    transition()
    await transitioned_halfway
    get_tree().change_scene_to_packed(scene)


func transition_to_scene(scene: Node) -> void:
    transition()
    await transitioned_halfway
    get_tree().unload_current_scene()
    get_tree().root.add_child(scene)


func transition() -> void:
    animation_player.play("default")

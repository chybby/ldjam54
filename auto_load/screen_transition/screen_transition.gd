extends CanvasLayer

signal transitioned_halfway

@onready var animation_player: AnimationPlayer = %AnimationPlayer


func emit_halfway() -> void:
    transitioned_halfway.emit()


func transition_to_scene(scene_file: String) -> void:
    transition()
    await transitioned_halfway
    get_tree().change_scene_to_file(scene_file)


func transition() -> void:
    animation_player.play("default")

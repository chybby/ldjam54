extends Node2D

@export var first_level_scene: PackedScene
@export var level_number: int = 1

@onready var level: Node2D = %Level
@onready var hud: CanvasLayer = %HUD
@onready var success_audio_player: AudioStreamPlayer = %SuccessAudioPlayer
@onready var success_g_maj := preload("res://assets/success_g_maj.mp3")
@onready var success_c_maj := preload("res://assets/success_c_maj.mp3")
@onready var bg_music := preload("res://assets/bg_music_extras.mp3")
@onready var confetti: GPUParticles2D = %Confetti


func _ready() -> void:
    MusicManager.add_music(bg_music)
    load_level(first_level_scene)


func load_level(level_scene: PackedScene):
    hud.reset()
    confetti.visible = false
    for child in level.get_children():
        child.queue_free()
    var level_instance = level_scene.instantiate()
    level.add_child(level_instance)
    level_instance.level_complete.connect(on_level_complete)
    level_instance.end_game.connect(on_end_game)
    hud.set_level_name(level_instance.level_name, level_number)
    level_number += 1


func disable_terrarium_input() -> void:
    var terrarium = get_tree().get_first_node_in_group("terrarium")
    if terrarium != null:
        terrarium.disable_input()


func on_end_game() -> void:
    disable_terrarium_input()
    _play_success_sound()
    confetti.visible = true
    confetti.restart()
    hud.show_next_level_button()
    await hud.next_level_button_pressed
    ScreenTransition.transition_to_scene_file("res://menus/game_over/game_over_screen.tscn")


func on_level_complete(next_level_scene: PackedScene) -> void:
    disable_terrarium_input()
    _play_success_sound()
    confetti.visible = true
    confetti.restart()
    hud.show_next_level_button()
    await hud.next_level_button_pressed
    ScreenTransition.transition_then(func():
        load_level(next_level_scene)
    )

func _play_success_sound():
    var key := MusicManager.get_music_key()
    var sound := success_g_maj
    if key == "c":
        sound = success_c_maj
    success_audio_player.stream = sound
    success_audio_player.play()

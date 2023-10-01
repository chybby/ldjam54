extends Node

var audio_stream_players: Array[AudioStreamPlayer]

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func add_music(audio: AudioStreamPlayer) -> void:
    audio = audio.duplicate()
    add_child(audio)
    
    audio.play()
    if not audio_stream_players.is_empty():
        var playback_pos: float = audio_stream_players[-1].get_playback_position()
        audio.volume_db = -20
        audio.seek(playback_pos)
        var tween = get_tree().create_tween()
        tween.tween_property(audio, "volume_db", 0, 2)
    audio_stream_players.append(audio)

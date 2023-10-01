extends Node

var audio_stream_players: Array[AudioStreamPlayer]

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func add_music(path: String) -> void:
    # Load music from the given path
    var file = FileAccess.open(path, FileAccess.READ)
    var sound = AudioStreamMP3.new()
    sound.data = file.get_buffer(file.get_length())
    sound.loop = true
    
    var asp := AudioStreamPlayer.new()
    add_child(asp)
    asp.stream = sound
    asp.play()
    
    if not audio_stream_players.is_empty():
        var playback_pos: float = audio_stream_players[-1].get_playback_position()
        asp.volume_db = -20
        asp.seek(playback_pos)
        var tween = get_tree().create_tween()
        tween.tween_property(asp, "volume_db", 0, 2)
    audio_stream_players.append(asp)

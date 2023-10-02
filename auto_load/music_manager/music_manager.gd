extends Node

var audio_stream_players: Array[AudioStreamPlayer]

# Go back to only one track. Add the given track if none are set.
func add_or_reset_music(audio: AudioStream) -> void:
    if audio_stream_players.is_empty():
        add_music(audio)
        return

    # Fade out all audio.
    var tween = get_tree().create_tween()
    for p in audio_stream_players.slice(1):
        tween.parallel().tween_property(p, "volume_db", -50, 2)
        tween.tween_callback(p.queue_free)
    await tween.finished

    audio_stream_players = [audio_stream_players[0]]


func add_music(audio: AudioStream) -> void:
    audio = audio.duplicate()
    var asp := AudioStreamPlayer.new()
    asp.stream = audio
    add_child(asp)

    asp.play()
    if not audio_stream_players.is_empty():
        var playback_pos: float = audio_stream_players[-1].get_playback_position()
        asp.volume_db = -20
        asp.seek(playback_pos)
        var tween = get_tree().create_tween()
        tween.tween_property(asp, "volume_db", 0, 2)
    audio_stream_players.append(asp)

func get_music_key() -> String:
    if audio_stream_players.is_empty():
        return "g"

    var playback_pos: float = audio_stream_players[-1].get_playback_position()
    var playback_len: float = audio_stream_players[-1].stream.get_length()

    if int(playback_pos / playback_len*8.0) % 2 == 0:
        return "g"
    else:
        return "c"

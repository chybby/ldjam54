extends Node

var audio_stream_players: Array[AudioStreamPlayer]

# Go back to only one track. Add the given track if none are set.
func add_or_reset_music(audio: AudioStreamPlayer) -> void:
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

extends CanvasLayer

signal exited
@export var enable_keyboard = true

var paused_tiles: Dictionary

func _input(event):
    if not enable_keyboard:
        return
    if event.is_action_pressed("pause"):
        to_remove()
        get_tree().paused = not get_tree().paused
        visible = not visible


func to_remove():
    var tile_set_atlas_source = get_tree().get_first_node_in_group("terrarium").tile_set.get_source(0)
    if visible:
        for atlas_coords in paused_tiles:
            var frame_duration = paused_tiles[atlas_coords]
            tile_set_atlas_source.set_tile_animation_frame_duration(atlas_coords, 0, frame_duration)
        paused_tiles.clear()
    else:
        for i in range(0, tile_set_atlas_source.get_tiles_count()):
            var atlas_coords = tile_set_atlas_source.get_tile_id(i)
            var frames_count = tile_set_atlas_source.get_tile_animation_frames_count(atlas_coords)
            if frames_count > 0:
                # Make a bold assumption the first frame has the same duration as the others.
                var frame_duration = tile_set_atlas_source.get_tile_animation_frame_duration(atlas_coords, 0)
                paused_tiles[atlas_coords] = frame_duration
                tile_set_atlas_source.set_tile_animation_frame_duration(atlas_coords, 0, INF)


func _on_volume_value_changed(volume):
    AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), volume)


func _on_exit_button_pressed():
    to_remove()
    get_tree().paused = false
    visible = false
    exited.emit()

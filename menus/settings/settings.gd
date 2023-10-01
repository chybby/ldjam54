extends CanvasLayer

func _input(event):
    if event.is_action_pressed("pause"):
        get_tree().paused = not get_tree().paused
        visible = not visible


func _on_volume_value_changed(volume):
    AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), volume)


func _on_exit_button_pressed():
    get_tree().paused = false
    visible = false

extends Node

signal plant_area_interacted(text: String)
signal plant_swapped(text: String)

func emit_plant_area_entered(text: String) -> void:
    plant_area_interacted.emit(text)

func emit_plant_area_exited() -> void:
    plant_area_interacted.emit("")

func emit_plant_swapped(text: String) -> void:
    plant_swapped.emit(text)

extends Node2D

@export var plant: Node2D

@onready var happy_particles: GPUParticles2D = %HappyParticles
@onready var sad_particles: GPUParticles2D = %SadParticles


func _ready() -> void:
    plant.satisfaction_changed.connect(on_plant_satisfaction_changed)


func on_plant_satisfaction_changed(satisfied: bool) -> void:
    print("emitting")
    if satisfied:
        happy_particles.emitting = true
        happy_particles.restart()
    else:
        sad_particles.emitting = true
        sad_particles.restart()

extends CharacterBody3D

@export var velocidade_base := 6.0

@onready var câmera = $"Câmera/Câmera3D"

var input_movimento := Vector2.ZERO

func _physics_process(delta: float) -> void:
	input_movimento = Input.get_vector("esquerda", "direita", "frente", "trás").rotated(-câmera.global_rotation.y)
	velocity = Vector3(input_movimento.x, 0, input_movimento.y) * velocidade_base
	move_and_slide()

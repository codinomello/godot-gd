extends Node3D

@export var aceleração_horizontal := 2.0
@export var aceleração_vertical := 1.0
@export var aceleração_mouse := 0.0005
@export var limite_mínimo_x: float
@export var limite_máximo_x: float

func _process(delta: float) -> void:
	var direção_joystick = Input.get_vector("pan_left", "pan_right", "pan_up", "pan_down")
	girar_vetor(direção_joystick * delta * Vector2(aceleração_horizontal, aceleração_vertical))

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		girar_vetor(event.relative * aceleração_mouse)

func girar_vetor(vetor: Vector2):
	if vetor.length() == 0: return
	rotation.x -= vetor.y
	rotation.y -= vetor.x
	rotation.x = clamp(rotation.x, limite_mínimo_x, limite_máximo_x)

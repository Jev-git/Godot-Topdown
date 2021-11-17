extends KinematicBody

export var m_fMoveSpeed: float = 10

onready var m_nAnimPlayer: AnimationPlayer = $RootNode/AnimationPlayer

onready var m_vMoveDirection: Vector3 = Vector3.ZERO

func _ready():
	move_lock_y = true
	m_nAnimPlayer.play("Idle")

func _physics_process(delta):
	var vMoveDirection: Vector3 = _get_move_direction()
	if vMoveDirection.length() > 0:
		m_nAnimPlayer.play("Run")
		move_and_slide(vMoveDirection * m_fMoveSpeed, Vector3.UP)
		rotation_degrees.y = rad2deg(Vector2(vMoveDirection.z, vMoveDirection.x).angle())
	else:
		m_nAnimPlayer.play("Idle")

func _get_move_direction() -> Vector3:
	return Vector3(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		0,
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

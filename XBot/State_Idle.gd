extends State

export var m_fSpeed: float = 10

func physics_process(_fDelta: float):
	if Input.is_action_just_pressed("ui_accept"):
		m_nStateMachine.change_state("Dash")
	elif Input.is_action_just_pressed("ui_cancel"):
		m_nStateMachine.change_state("Parry")
	else:
		var vMoveDirection: Vector3 = _get_move_direction()
		if vMoveDirection.length() > 0:
			m_nStateMachine.m_nParentNode.move(vMoveDirection, m_fSpeed)
			m_nStateMachine.m_nAnimPlayer.play("Run")
		else:
			m_nStateMachine.m_nAnimPlayer.play("Idle")

func get_hit(_nOtherNode: Node):
	m_nStateMachine.change_state("Hurt")

func _get_move_direction() -> Vector3:
	var vInput: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");
	return Vector3(vInput.x, 0, vInput.y);

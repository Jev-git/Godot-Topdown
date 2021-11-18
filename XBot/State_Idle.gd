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

func _get_move_direction() -> Vector3:
	return Vector3(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		0,
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

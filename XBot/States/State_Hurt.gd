extends State

export var m_fDuration: float = 0.2

func enter_state():
	m_nStateMachine.m_nAnimPlayer.play("Hurt")
	Input.start_joy_vibration(0, 0.5, 0, 0.2)
	get_viewport().get_camera().shake()
	yield(get_tree().create_timer(m_fDuration), "timeout")
	m_nStateMachine.change_state("Idle")

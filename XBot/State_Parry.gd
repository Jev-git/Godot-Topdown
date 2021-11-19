extends State

export var m_fDuration: float = 0.1

func enter_state():
	m_nStateMachine.m_nAnimPlayer.play("Parry")
	yield(get_tree().create_timer(m_fDuration), "timeout")
	m_nStateMachine.change_state("Idle")

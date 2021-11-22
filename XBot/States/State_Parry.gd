extends State

export var m_fDuration: float = 0.1

func enter_state():
	.enter_state()
	yield(get_tree().create_timer(m_fDuration), "timeout")
	m_nStateMachine.change_state("Idle")

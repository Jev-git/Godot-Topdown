extends State

export var m_fSpeed: float = 30
export var m_fDuration: float = 0.1

func enter_state():
	m_nStateMachine.m_nAnimPlayer.play("Run")
	m_nStateMachine.m_nParentNode.trigger_dash_i_frame(true)
	Input.start_joy_vibration(0, 0.5, 0, 0.1)
	yield(get_tree().create_timer(m_fDuration), "timeout")
	m_nStateMachine.change_state("Idle")
	m_nStateMachine.m_nParentNode.trigger_dash_i_frame(false)

func physics_process(_fDelta: float):
	m_nStateMachine.m_nParentNode.dash_forward(m_fSpeed)

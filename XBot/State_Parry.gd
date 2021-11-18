extends State

export var m_fDuration: float = 0.2

func enter_state():
	m_nStateMachine.m_nAnimPlayer.play("Block")
	yield(get_tree().create_timer(m_fDuration), "timeout")
	m_nStateMachine.change_state("Idle")

func get_hit(_nOtherNode: Node):
	print("Parried %s" % _nOtherNode.get_path())

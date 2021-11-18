extends Node
class_name State

onready var m_nStateMachine: Node = _get_state_machine(self)

func enter_state():
	pass

func exit_state():
	pass

func process(_fDelta: float):
	pass

func physics_process(_fDelta: float):
	pass

func _get_state_machine(_nNode: Node):
	if _nNode.is_in_group("StateMachine"):
		return _nNode
	else:
		return _get_state_machine(_nNode.get_parent())

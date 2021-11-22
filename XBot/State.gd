extends Node
class_name State

export var m_fAnimSpeed: float = 1
export var m_sAnimName: String
export var m_fStateCooldown: float = 0
onready var m_bIsAvailable: bool = true

onready var m_nStateMachine: Node = _get_state_machine(self)

func enter_state():
	m_nStateMachine.m_nAnimPlayer.set_speed_scale(m_fAnimSpeed)
	m_nStateMachine.m_nAnimPlayer.play(m_sAnimName)

func exit_state():
	if m_fStateCooldown > 0:
		m_bIsAvailable = false
		yield(get_tree().create_timer(m_fStateCooldown), "timeout")
		m_bIsAvailable = true

func process(_fDelta: float):
	pass

func physics_process(_fDelta: float):
	pass

func get_hit(_nOtherNode: Node):
	pass

func on_anim_finished(_sAnimName: String):
	pass

func _get_state_machine(_nNode: Node):
	if _nNode.is_in_group("StateMachine"):
		return _nNode
	else:
		return _get_state_machine(_nNode.get_parent())

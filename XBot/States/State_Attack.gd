extends State

export var m_sNextStateName: String

func _ready():
	yield(owner, "ready")
	m_nStateMachine.m_nAnimPlayer.connect("animation_finished", self, "_on_anim_finished")

func on_anim_finished(_sAnimName: String):
	m_nStateMachine.change_state(m_sNextStateName)

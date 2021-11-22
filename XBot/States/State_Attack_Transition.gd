extends State

export var m_sNextStateName: String

func _ready():
	yield(owner, "ready")
	m_nStateMachine.m_nAnimPlayer.connect("animation_finished", self, "_on_anim_finished")

func physics_process(_fDelta: float):
	if Input.is_action_just_pressed("ui_action"):
		m_nStateMachine.change_state(m_sNextStateName)

func on_anim_finished(_sAnimName: String):
	m_nStateMachine.change_state("Idle")

extends State

export var m_fAnimSpeed: float = 5

func _ready():
	yield(owner, "ready")
	m_nStateMachine.m_nAnimPlayer.connect("animation_finished", self, "_on_anim_finished")

func enter_state():
	m_nStateMachine.m_nAnimPlayer.play("Punch_Left")
	m_nStateMachine.m_nAnimPlayer.set_speed_scale(m_fAnimSpeed)

func _on_anim_finished(_sAnimName: String):
	if _sAnimName == "Punch_Left":
		m_nStateMachine.m_nAnimPlayer.set_speed_scale(1)
		m_nStateMachine.change_state("Idle")

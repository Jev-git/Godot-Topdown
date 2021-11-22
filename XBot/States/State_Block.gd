extends State

export var m_fDuration: float = 0.2

onready var m_bIsSuccessfulParry: bool = false

onready var m_nDurationTimer: Timer = $DurationTimer

func _ready():
	m_nDurationTimer.connect("timeout", self, "_on_duration_timer_timeout")

func enter_state():
	m_nStateMachine.m_nAnimPlayer.play("Block")
	m_nDurationTimer.start(m_fDuration)

func get_hit(_nOtherNode: Node):
	m_nDurationTimer.stop()
	m_bIsSuccessfulParry = true
	m_nStateMachine.change_state("Parry")

func _on_duration_timer_timeout():
	m_nStateMachine.change_state("Idle")

func exit_state():
	if m_bIsSuccessfulParry:
		print("true")
		m_bIsAvailable = true
		m_bIsSuccessfulParry = false
	else:
		.exit_state()

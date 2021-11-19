extends Camera

export var m_fDuration: float = 0.2
export var m_fFrequency: float = 15
export var m_fAmplitude: float = 0.1

onready var m_nTween: Tween = $Tween
onready var m_nDurationTimer: Timer = $DurationTimer
onready var m_nFrequencyTimer: Timer = $FrequencyTimer

func _ready():
	m_nDurationTimer.connect("timeout", self, "_on_duration_timer_timeout")
	m_nFrequencyTimer.connect("timeout", self, "_on_frequency_timer_timeout")

func shake():
	m_nDurationTimer.start(m_fDuration)
	m_nFrequencyTimer.start(1 / m_fFrequency)
	_new_shake()

func _new_shake():
	var nRandomAmplitude: Vector2 = Vector2(rand_range(-m_fAmplitude, m_fAmplitude),
											rand_range(-m_fAmplitude, m_fAmplitude))
	
	m_nTween.interpolate_property(self, "h_offset", h_offset, nRandomAmplitude.x,
								1 / m_fFrequency, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	m_nTween.interpolate_property(self, "v_offset", v_offset, nRandomAmplitude.y,
								1 / m_fFrequency, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	m_nTween.start()

func _on_duration_timer_timeout():
	m_nTween.interpolate_property(self, "h_offset", h_offset, 0,
								1 / m_fFrequency, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	m_nTween.interpolate_property(self, "v_offset", v_offset, 0,
								1 / m_fFrequency, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	m_nTween.start()
	m_nFrequencyTimer.stop()

func _on_frequency_timer_timeout():
	_new_shake()

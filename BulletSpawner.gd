extends Spatial

export var m_psBullet: PackedScene

onready var m_nTimer: Timer = $Timer

func _ready():
	m_nTimer.connect("timeout", self, "_spawn_bullet")

func _spawn_bullet():
	var nBullet = m_psBullet.instance()
	nBullet.m_vMoveDirection = Vector3.BACK
	add_child(nBullet)

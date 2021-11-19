extends KinematicBody

export var m_fMoveSpeed: float = 15

var m_vMoveDirection: Vector3

func _physics_process(delta):
	if get_slide_count() > 0:
		var nPlayer: Object = get_slide_collision(0).collider
		if nPlayer.has_signal("get_hit"):
			nPlayer.emit_signal("get_hit", self)
		queue_free()
	else:
		move_and_slide(m_vMoveDirection * m_fMoveSpeed)

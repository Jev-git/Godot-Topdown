extends KinematicBody

func move(_vMoveDirection: Vector3, _fSpeed: float):
	move_and_slide(_vMoveDirection * _fSpeed, Vector3.UP)
	rotation_degrees.y = rad2deg(Vector2(_vMoveDirection.z, _vMoveDirection.x).angle())

func dash_forward(_fSpeed: float):
	var vForwardDirection: Vector2 = Vector2.DOWN.rotated(-deg2rad(rotation_degrees.y))
	move_and_slide(Vector3(vForwardDirection.x, 0, vForwardDirection.y) * _fSpeed, Vector3.UP)
	

extends RayCast

var dragging = false
var current_mouse_position
var next_mouse_position
var obj
export var collided = false

func _physics_process(delta):
	
	if self.is_colliding():
		var collider = self.get_collider()
		obj = collider.get_parent().get_parent()
#		print(obj.get_parent().transform.origin)
#		dragging = true
		print(obj)
		current_mouse_position = get_viewport().get_mouse_position()
		collided = true
	
	if dragging:
		next_mouse_position = get_viewport().get_mouse_position()
		var move_x = -(obj.transform.origin.x - next_mouse_position.x) * .5 * delta
		var move_z = -(obj.transform.origin.y - next_mouse_position.y) * .5 * delta
		var next_position = Vector3(move_x, obj.transform.origin.y, move_z)
		obj.set_translation(next_position)
		print(next_position)

#func stored_condition():
	

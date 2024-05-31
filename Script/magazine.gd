extends Spatial

#onready var imported_collided = get_node('../gun/RayCast').get("collided")

func _on_draggable_mag_drag_move(node, cast):
#	print(imported_collided)
#	var positionX = cast.position.x - 0.377
	var mag_pos = get_node('.').transform.origin
	var offset = -(mag_pos - cast.position) * .3 + cast.position
#	print(mag_pos)
	var position = Vector3(offset.x, mag_pos.y ,offset.z)
	set_translation(position)


func _on_Area_area_entered(area):
	print(area)


func _on_Area_body_entered(body):
	print(body)

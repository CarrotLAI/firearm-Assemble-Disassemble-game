extends Spatial

func _on_draggable_mag_drag_move(node, cast):
#	var positionX = cast.position.x - 0.377
	var position = Vector3(cast.position.x,0,cast.position.z)
	print(position.y)
	set_translation(position)


func _on_Area_area_entered(area):
	print(area)

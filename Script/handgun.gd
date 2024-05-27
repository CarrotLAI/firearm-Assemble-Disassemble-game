extends Spatial

export var condition_to_win = [0,0]
onready var ray_cast = $Spatial/RayCast


func _on_Draggable_drag_move(node, cast):
	set_translation(cast['position']*.1)


func _ready():
#	print_debug(global_transform.origin)
	pass



#func _input(event):
#	if event.is_action_pressed("click") and ray_cast.is_colliding():
#		var collider = ray_cast.get_collider()
#		print("Dropped object:", collider)

func _on_restrict_area_entered(area):
	print_debug(area)
	
func _on_condition_area_area_exited(area):
	condition_to_win[1]= 1
	print_debug(condition_to_win)
	

func _on_condition_mag_area_exited(area):
	condition_to_win[0]= 1
	print_debug(condition_to_win)

extends Spatial

var condition_to_win = [{"mag_area": 0}, {"slide_area":0}, {"spring_area":0}, {"barel_area": 0}]
#onready var ray_cast = $Spatial/RayCast
var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var switch = false


func _process(delta):
	if condition_to_win == [{"mag_area": 1}, {"slide_area": 1},{"spring_area": 1},{"barel_area": 1}]:
		print("congratulations")
#func _on_restrict_area_entered(area):
#	print_debug(area)
	
#func _on_condition_area_area_exited(area):
#	condition_to_win[1]= 1
#	print_debug(condition_to_win)
	
#
#func _on_condition_mag_area_exited(area):
#	condition_to_win[0]= 1
#	print_debug(condition_to_win)



func _on_magazine_area_area_exited(area):
	if area.name == "magazine_area":
		condition_to_win[0] = {"mag_area": 1}
		print(condition_to_win)


func _on_slide_area_area_exited(area):
	if area.name == "slide_area":
		condition_to_win[0] = {"slide_area": 1}


func _on_spring_area_area_exited(area):
	if area.name == "spring_area":
		condition_to_win[0] = {"spring_area": 1}

func _on_barel_area_area_exited(area):
	if area.name == "barel_area":
		condition_to_win[0] = {"barel_area": 1}

extends Spatial

export var condition_to_win = [0,0]
onready var ray_cast = $Spatial/RayCast

var rotating = false
var prev_mousePos
var next_mousePos
var hovered

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



#detecting input
func _on_trigger_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			if hovered:
				set_process(true)
		else:
			set_process(false)
	
#Responsible for rotating the trigger to z=25
func _process(delta):
	var trigger = hovered
#	var rotation = trigger.rotation_degrees
	
	if Input.is_action_just_pressed("click"):
		rotating = true
		prev_mousePos = get_viewport().get_mouse_position()
	if Input.is_action_just_released("click"):
		rotating = false
		trigger = Vector3()
		set_process(false)	
		
	if rotating:
		next_mousePos = get_viewport().get_mouse_position()
		trigger.rotate_z(-(next_mousePos.x - prev_mousePos.x) * .3 * delta)
#		trigger.translate = (next_mousePos.y - prev_mousePos.y) * .1 * delta
		prev_mousePos = next_mousePos
	
#	if rotation.z == 25:
#		print("true")
#		trigger.rotation_degrees = next_mousePos

func _on_trigger_mouse_entered():
	hovered = get_node('./Spatial/trigger')
	

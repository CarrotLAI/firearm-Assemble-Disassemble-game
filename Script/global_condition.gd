extends Spatial

onready var timer = $time/Timer
onready var condition_to_win = {
	"mag_area": 0,
	"slide_area": 0,
	"spring_area": 0, 
	"barel_area": 0
}
#onready var ray_cast = $Spatial/RayCast
var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var switch = false

func _ready():
	set_process(false)

func _on_magazine_area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
#			start_timer()
			set_process(true)


func _process(delta):
	if condition_to_win.mag_area == 1: 
		if condition_to_win.slide_area == 1:
			if condition_to_win.spring_area == 1:
				if condition_to_win.barel_area == 1:
					print("congratulations")

#func start_timer():
#	timer.start()
#	timer.get_wait_time() - day()
#	print(timer)
	

func _on_magazine_area_area_exited(area):
	if condition_to_win.mag_area != 1:
		if area.name == "magazine_area":
			condition_to_win.mag_area = 1
			print(condition_to_win.mag_area)
	
		

func _on_slide_area_area_exited(area):
	if condition_to_win.slide_area !=  1:
		if area.name == "slide_area":
			condition_to_win.slide_area = 1
			print(condition_to_win.slide_area)
	

func _on_spring_area_area_exited(area):
	if condition_to_win.spring_area != 1:
		if area.name == "spring_area":
			condition_to_win.spring_area = 1
			print("spring: ",condition_to_win.spring_area)
	
func _on_barel_area_area_exited(area):
	if condition_to_win.barel_area != 1:
		if area.name == "barrel_area":
			condition_to_win.barel_area = 1
			set_process(true)
			print(condition_to_win)
	

func _on_Timer_timeout():
	pass # Replace with function body.

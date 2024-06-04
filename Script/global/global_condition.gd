extends Spatial

onready var timer = $time/Timer
onready var main = $".."
onready var condition_to_win = {
	"mag_area": 0,
	"slide_area": 0,
	"spring_area": 0, 
	"barel_area": 0
}
var result_scene = load("res://Scene/result/game_result.tscn")
# Instantiate the scene
var resultUI = result_scene.instance()
#onready var ray_cast = $Spatial/RayCast
var rotating = false
var prev_mousePos
var next_mousePos
var hovered
var slide_lock_open = false
var switch = false

#var for time
onready var timer_label = $time/VBoxContainer/timer_label
var time_passed
var time = 0
var is_time = false
var secs
var mins



func _ready():
	set_process(false)

func _on_magazine_area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
#			start_timer()
			set_process(true)
			is_time = true


func _process(delta):
	if is_time:
		time += delta
	
	secs = fmod(time, 60)
	mins = fmod(time, 60*60) / 60
	
	time_passed = "%02d : %02d" % [mins, secs]
	timer_label.text = time_passed
	
	if condition_to_win.mag_area == 1: 
		if condition_to_win.slide_area == 1:
			if condition_to_win.spring_area == 1:
				if condition_to_win.barel_area == 1:
					main.add_child(resultUI)
					pass_time_result()
					set_process(false)

func pass_time_result():
	var time = resultUI.get_node(".")
	time.get_result_time(time_passed)
	

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
	


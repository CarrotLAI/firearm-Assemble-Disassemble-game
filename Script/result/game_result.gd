extends Spatial

onready var back_start = preload("res://Scene/game_index.tscn")
onready var label = $result/container/time_label
onready var set_false = set_process(false)
var value

func _process(delta):
	label.rect_position = Vector2(650, 100)
	label.rect_size = Vector2(100, 0)
	label.text = value
	
func get_result_time(val):
	value = val
	set_process(true)
	
	
func _on_back_pressed():
	get_tree().change_scene_to(back_start)

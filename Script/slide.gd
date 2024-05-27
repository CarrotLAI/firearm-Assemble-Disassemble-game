extends Spatial

onready var barel = $"../barel"
onready var spring = $"../spring"
onready var main = $"."

#var scene = preload("res://Scene/barel.tscn")
#var instance = scene.instance()
var objects = []
var camera
var is_drag = false
var offset 
var posX 
var posZ 
var newPos

func _on_Draggable_drag_move(node, cast):
#	var drag_offset = cast.collider.get_parent().transform.origin#floor origin
#	var position = Vector3(drag_offset.x, 0, drag_offset.z)
	is_drag = true
	posX = 0
	posZ = 0
	
	if is_drag:
		offset = (self.transform.origin)
		posX = (offset.x - cast.position.x) * .1
		posZ = (offset.z - cast.position.z) * .1
		newPos = Vector3(cast.position.x - posX, 0,cast.position.z - posZ)
		print("translation: ", offset.x)
		print("casthit: ", cast.position.x)
		set_translation(newPos)
	is_drag = false
	return Vector3()
#	set_translation(offset.z)
#	if Input.is_action_just_pressed("ui_touch") || Input.is_action_just_pressed("click"):
##		is_drag = true:
	
##		set_translation(newPos)
#	return Vector3()
#


func _on_slide_body_entered(body):
	print("click the area")


func _on_Draggable_drag_stop(node):
	is_drag = false

extends Spatial

onready var barel = $"../barel"
onready var spring = $"../spring"
onready var main = $"."
onready var overall_slide = $"%slide"
onready var imported_array = get_node('gun')
#var scene = preload("res://Scene/barel.tscn")
#var instance = scene.instance()
var objects = []
var camera
var drag_to_right = true
var drag_to_left = false
var remove_bullet = false
var offset 
var posX 
var posZ 
var newPos

#func _ready():
#
#	print(slideAll.transform.origin)
	
func _on_Draggable_drag_move(node, cast):
#	var drag_offset = cast.collider.get_parent().transform.origin#floor origin
#	var position = Vector3(drag_offset.x, 0, drag_offset.z)

	if drag_to_right:
		remove_bullet(node, cast)
	if drag_to_left:
		remove_slide(node, cast)
#	set_translation(offset.z)
#	if Input.is_action_just_pressed("ui_touch") || Input.is_action_just_pressed("click"):
##		is_drag = true:
	
##		set_translation(newPos)
#	return Vector3()
#
func remove_bullet(node, cast):
	var slide = get_node("./Spatial")
	offset = (slide.transform.origin)
	posX = (offset.x - cast.position.x) * .3
	posZ = (offset.z - cast.position.z) * .1
	newPos = Vector3( posX, offset.y, offset.z)
	if posX >= -1 and posX <=0:
#			print("translation: ", offset)
#			print("casthit: ", cast.position)
#			print(newPos)
		slide.set_translation(newPos)
		if !remove_bullet:
			print("remove bullet")
			remove_bullet = true
#			_on_Draggable_slide_drag_stop(node)
	

func remove_slide(node, cast):
	drag_to_right = false
	var translate = (overall_slide.transform.origin)
#	print("translate: ", translate.x)
#	print("cast: ",cast.position.x)
	posX = cast.position.x
	posZ = cast.position.z
	newPos = Vector3( posX, translate.y, translate.z)
	if posX > 0 and posX < 1:
		set_translation(newPos)
	if posX >= 0.7:
		newPos = Vector3( posX, translate.y, posZ)
		set_translation(newPos)

func _on_Draggable_slide_drag_stop(node):
	print("..")
	var slide = get_node("./Spatial")
#	var position = slide.transform.origin
	var oldPos = Vector3() * .1	
	slide.set_translation(oldPos)
	if remove_bullet:
		drag_to_left = true
	
	
func _on_slide_body_entered(body):
	print("click the area")


#func _on_Draggable_drag_stop(node):
#	is_drag = false


func _on_SpringDrag_drag_move(node, cast):
	var spring = get_node("%spring")
	offset = (self.transform.origin)
	print(offset)
	spring.set_translation(cast.position)



func _on_slide_area_exited(area):
	print(area)


func _on_Draggable_barrel_drag_move(node, cast):
	pass # Replace with function body.

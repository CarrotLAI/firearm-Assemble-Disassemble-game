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
var bullet_remove = false
var slide_remove = false
var slide_lock_open = false
var offset 
var posX 
var posZ 
var newPos

#func _ready():
#	print(slideAll.transform.origin)
	
func _on_Draggable_drag_move(node, cast):
#	var drag_offset = cast.collider.get_parent().transform.origin#floor origin
#	var position = Vector3(drag_offset.x, 0, drag_offset.z)
#	print(GRayCast.condition_to_remove_slide)
#	var slide_lock = GCondition.slide_lock_open
	if drag_to_right:
		remove_bullet(node, cast)
	if slide_lock_open:
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
	if !bullet_remove:
		print("remove bullet")
		bullet_remove = true
#		_on_Draggable_slide_drag_stop(node)
	return 
	
func remove_slide(node, cast):
#	print("remove slide")
	var translate = (overall_slide.transform.origin)
#	drag_to_right = false
#	print("translate: ", translate.x)
#	print("cast: ",cast.position.x)
	posX = cast.position.x
	posZ = cast.position.z
	newPos = Vector3( posX, translate.y, translate.z)
	#if it's still inside of the area:
	if posX <= -0 and posX >= -2:
		set_translation(newPos)
		#if outside of the area
		if posX <= -1.1:
			slide_remove = true
#	set_translation((Vector3() * .1))
	if slide_remove:
		newPos = Vector3( posX, translate.y, posZ)
		set_translation(newPos)

func _on_Draggable_slide_drag_stop(node):
	var slide = get_node("./Spatial")
#	var position = slide.transform.origin
	var oldPos = Vector3() * .1	
	slide.set_translation(oldPos)
	if slide_remove:
		#set rotation degrees
		pass
	
	
#func _on_Draggable_drag_stop(node):
#	is_drag = false


func _on_SpringDrag_drag_move(node, cast):
#	var draggable = get_node("Spatial/slide/slide/Draggable_slide")
#	draggable.disconnect("Draggable_slide", self, "_on_SpringDrag_drag_move")
	var spring = get_node("%spring")
	offset = (spring.transform.origin)
	var positionX = (offset.x - cast.position.x) * .4
	var positionY = -(offset.y - cast.position.y) *.4
	newPos = Vector3(positionX, positionY, offset.z)
	print(offset)
	spring.set_translation(newPos)



func _on_slide_area_exited(area):
	print(area)


func _on_Draggable_barrel_drag_move(node, cast):
	set_translation(cast.position)


func _on_slide_lock_input_event(camera, event, position, normal, shape_idx):
	if event.is_pressed():
		slide_lock_open = true
		print(slide_lock_open)

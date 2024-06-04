extends Control

#onready var control = $Control
# Load the scene you want to add
#var scene_to_add = preload("res://Scene/select_lvl.tscn")
## Instantiate the scene
#var instance = scene_to_add.instance()

var glock_disassemble = load("res://Scene/glock_disassemble.tscn")
#func _on_easy_pressed():
#	get_tree().change_scene_to(easy_scene)

func _on_disassemble_pressed():
	get_tree().change_scene_to(glock_disassemble)

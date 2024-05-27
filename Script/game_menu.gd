extends Control

onready var control = $Control
# Load the scene you want to add
#var scene_to_add = preload("res://Scene/select_lvl.tscn")
## Instantiate the scene
#var instance = scene_to_add.instance()

var easy_scene = preload("res://Scene/game_lvl_easy.tscn")
func _on_easy_pressed():
	get_tree().change_scene_to(easy_scene)

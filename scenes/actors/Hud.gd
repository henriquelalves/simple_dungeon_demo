
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	get_node("key").set_text(str(get_node("/root/global").player_keys))


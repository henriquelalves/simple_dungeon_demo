
extends Area

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Random material
	var rand_size = get_node("/root/global").dungeon_wall_materials.size()
	get_node("Cube").set_material_override(get_node("/root/global").dungeon_wall_materials[randi()%rand_size])
	pass



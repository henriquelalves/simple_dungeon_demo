extends Spatial

export var dungeon_h_size = 10
export var dungeon_v_size = 10

func _ready():
	# Create the walls of the dungeon
	var dungeon_wall = load("res://scenes/actors/Dungeon_wall.tscn")
	var cell_size = get_node("Walls_gridmap").get_cell_size()
	for x in range(dungeon_h_size):
		for z in range(dungeon_v_size):
			if get_node("Walls_gridmap").get_cell_item(x,0,z) == 0:
				var wall = dungeon_wall.instance()
				wall.set_translation(Vector3(x*cell_size + 1.0,1.0,z*cell_size + 1.0))
				add_child(wall)
	get_node("Walls_gridmap").queue_free()
	pass



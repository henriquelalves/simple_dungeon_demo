extends Spatial

export var dungeon_h_size = 10
export var dungeon_v_size = 10

func _ready():
	# Setup wall and ceiling
	get_node("Floor").set_translation(Vector3(dungeon_h_size,0,dungeon_v_size))
	get_node("Floor").set_region_rect(Rect2(0,0,32*dungeon_h_size,32*dungeon_v_size))
	get_node("Ceiling").set_translation(Vector3(dungeon_h_size,2,dungeon_v_size))
	get_node("Ceiling").set_region_rect(Rect2(0,0,32*dungeon_h_size,32*dungeon_v_size))
	
	# Create the walls of the dungeon
	var Dungeon_wall = load("res://scenes/actors/Dungeon_wall.tscn")
	var Key = load("res://scenes/actors/Key.tscn")
	var Door = load("res://scenes/actors/Door.tscn")
	var cell_size = get_node("Dungeon_gridmap").get_cell_size()
	for x in range(dungeon_h_size):
		for z in range(dungeon_v_size):
			if get_node("Dungeon_gridmap").get_cell_item(x,0,z) == 0: # Wall
				var wall = Dungeon_wall.instance()
				wall.set_translation(Vector3(x*cell_size + 1.0,1.0,z*cell_size + 1.0))
				add_child(wall)
			elif get_node("Dungeon_gridmap").get_cell_item(x,0,z) == 1: # Key
				var key = Key.instance()
				key.set_translation(Vector3(x*cell_size + 1.0,1.0,z*cell_size + 1.0))
				add_child(key)
			elif get_node("Dungeon_gridmap").get_cell_item(x,0,z) == 2: # Door
				var door = Door.instance()
				print(get_node("Dungeon_gridmap").get_cell_item_orientation(x,0,z))
				door.set_translation(Vector3(x*cell_size + 1.0,1.0,z*cell_size + 1.0))
				if get_node("Dungeon_gridmap").get_cell_item_orientation(x,0,z) == 0 or get_node("Dungeon_gridmap").get_cell_item_orientation(x,0,z) == 10:
					door.set_rotation_deg(Vector3(0,90,0))
				add_child(door)
	get_node("Dungeon_gridmap").queue_free()
	pass



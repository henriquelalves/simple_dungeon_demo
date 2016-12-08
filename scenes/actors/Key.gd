extends Area


func _ready():
	add_to_group("key")
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	set_rotation_deg(get_rotation_deg() + Vector3(0.0, 1.0, 0.0))
	
	if(get_overlapping_areas().size() > 0): # Player checking area
		get_node("/root/global").player_keys += 1
		queue_free()


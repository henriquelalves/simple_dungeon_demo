extends Area


func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if(get_overlapping_areas().size() > 0): # Player checking area
		get_node("/root/global").player_keys += 1
		queue_free()


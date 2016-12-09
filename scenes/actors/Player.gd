extends Spatial

var target_direction = 0.0 # in degrees
var test_position = Vector3()
var target_position = Vector3()
var moving_area = null
var wait = false

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
	add_to_group("player")
	
	var Moving_area = load("res://scenes/actors/Player_moving_area.tscn")
	moving_area = Moving_area.instance()
	get_parent().call_deferred("add_child",moving_area)
	
	target_position = get_translation()
	test_position = get_translation()
	target_direction = get_rotation().y
	pass

func _input(event):
	if event.type != InputEvent.KEY:
		return 
	if event.is_pressed() and event.scancode == KEY_UP and event.is_echo() == false:
		var normal = Vector3(sin(-target_direction), 0.0, cos(-target_direction))
		test_position = target_position + 2*normal
		moving_area.set_translation(test_position)
		wait = true
	elif event.is_pressed() and event.scancode == KEY_DOWN and event.is_echo() == false:
		var normal = Vector3(sin(-target_direction), 0.0, cos(-target_direction))
		test_position = target_position - 2*normal
		moving_area.set_translation(test_position)
		wait = true
	elif event.is_pressed() and event.scancode == KEY_LEFT and event.is_echo() == false:
		test_position = target_position
		target_direction -= deg2rad(90)
	elif event.is_pressed() and event.scancode == KEY_RIGHT and event.is_echo() == false:
		test_position = target_position
		target_direction += deg2rad(90)

func _fixed_process(delta):
	# Update translation
	var new_pos = get_translation()
	new_pos.x = lerp(new_pos.x, target_position.x, 0.1)
	new_pos.z = lerp(new_pos.z, target_position.z, 0.1)
	set_translation(new_pos)
	
	# Update rotation
	var new_rot = get_rotation()
	new_rot.y = lerp(new_rot.y, target_direction, 0.15)
	set_rotation(new_rot)
	
	if wait == true: # have to lose a frame to make area overlap work
		wait = false
	elif(moving_area.get_overlapping_areas().size() == 0):
		target_position = test_position
	else:
		test_position = target_position
		moving_area.set_translation(target_position)


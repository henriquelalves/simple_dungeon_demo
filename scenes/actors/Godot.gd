extends Sprite3D

var timer = 0.0
var going_up = true
var v_delta = 0.4
var initial_pos = Vector3()
const LIMIT_V = 2.0


func _ready():
	set_fixed_process(true)
	initial_pos = get_translation()
	pass

func _fixed_process(delta):
	set_rotation_deg(get_rotation_deg() + Vector3(0.0,1.0,0.0))
	
	timer += delta
	if timer >= LIMIT_V:
		timer -= LIMIT_V
		going_up = !going_up
	
	var new_pos_y
	if going_up:
		new_pos_y = lerp(get_translation().y,initial_pos.y + v_delta, 0.005)
	else:
		new_pos_y = lerp(get_translation().y,initial_pos.y - v_delta, 0.005)
	set_translation(Vector3(get_translation().x, new_pos_y, get_translation().z))

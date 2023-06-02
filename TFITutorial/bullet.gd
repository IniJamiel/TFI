extends CharacterBody2D

signal kalah
var nyamping

func _ready():
	nyamping = randi_range(-1,1)
	connect("kalah",get_parent().kalah)

func _physics_process(delta):
	
	var speed = (Global.level*Global.globalSpeedScale) + Global.base_speed 
	if not is_on_floor():
		velocity.y = speed
	velocity.x = speed * nyamping
	move_and_slide()


func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player")):
		emit_signal("kalah")
	if(body.is_in_group("Bawah")):
		Global.level += 1
		queue_free()
	if(body.is_in_group("Samping")):
		nyamping = -1 * nyamping

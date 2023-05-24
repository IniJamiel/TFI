extends CharacterBody2D


const JUMP_VELOCITY = -400.0
var geser
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var bounced = 1
signal kalah
func _ready():
	geser = randi_range(0,1)
	connect("kalah",get_parent().kalah)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y = Global.speedMain + (Global.speedscale * Global.level)
		velocity.x = bounced*(Global.speedMain + (Global.speedscale * Global.level)) * geser
		
	# Handle Jump.
	move_and_slide()



func _on_area_2d_body_entered(body):
	var groups = body.get_groups()
	for a in groups:
		print(String(a))
	if body.is_in_group("Player"):
		emit_signal("kalah")
	if body.is_in_group("Samping"):
		bounced = -bounced
	if body.is_in_group("Bawah"):
		Global.level += 1
		queue_free()

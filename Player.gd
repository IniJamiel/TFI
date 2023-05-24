extends CharacterBody2D

var SPEED


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# As good practice, you should replace UI actions with custom gameplay actions.
	SPEED = Global.playerspeedScale * (Global.speedMain + Global.level)
	var direction = Input.get_axis("Kiri", "Kanan")
	if direction:
		velocity.x = direction * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

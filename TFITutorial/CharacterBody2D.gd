extends CharacterBody2D



func _physics_process(delta):
	var direction = Input.get_axis("Kiri","Kanan")
	var speed = (Global.level*Global.globalSpeedScale) + Global.base_speed 
	velocity.x = speed * direction * Global.playerspeedScale
	move_and_slide()

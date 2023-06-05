extends CharacterBody2D



func _physics_process(delta):
	var direction = Input.get_axis("Kiri","Kanan")
	
	if Input.is_action_pressed("Kanan"):
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = false
		$AnimationPlayer.play("Run Right")
	elif Input.is_action_pressed("Kiri"):
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = true
		$AnimationPlayer.play("Run Left")		
		
	if Input.is_action_just_released("Kanan")|| Input.is_action_just_released("Kiri"):
		$AnimatedSprite2D.pause()
		$AnimationPlayer.pause()
	
	var speed = (Global.level*Global.globalSpeedScale) + Global.base_speed 
	velocity.x = speed * direction * Global.playerspeedScale
	move_and_slide()

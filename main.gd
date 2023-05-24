extends Node2D


var BulletNode = preload("res://bullet.tscn")
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "Level: "+ str(Global.level)


func _on_timer_timeout():
	var position = Vector2(randi_range($Anchor1.position.x,$Anchor2.position.x),$Anchor1.position.y)
	var instance = BulletNode.instantiate()
	instance.position = position
	add_child(instance)
	


func _on_timer_kalah_timeout():
	get_tree().reload_current_scene()

func kalah():
	$LabelKalah.visible = true
	$TimerKalah.start()

extends Node2D

var bulletScene = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "Level: " + str(Global.level)


func _on_timer_timeout():
	var bulletInstance = bulletScene.instantiate()
	var position = Vector2(randi_range($AnchorKiri.position.x,$AnchorKanan.position.x),$AnchorKanan.position.y)
	bulletInstance.position = position
	add_child(bulletInstance)

func kalah():
	print("kalah")
	$Timer2.start()
	$LabelKalah.visible = true
	$LabelKalah.text = "Level Terakhir: "+ str(Global.level)
#	
#get_tree().reload_current_scene()



func _on_timer_2_timeout():
	get_tree().reload_current_scene()

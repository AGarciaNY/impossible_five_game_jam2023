extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/VBoxContainer/Start.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	var music = $Piano.play();
	get_tree().change_scene("res://kitchen/kitchen.tscn");
	
#func _on_Tutorial_pressed():
#	var options = load().instance()
#	get_tree().current_scene.add_child(options)

func _on_Quit_pressed():
	get_tree().quit()


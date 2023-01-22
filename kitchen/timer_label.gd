extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var time = 0
var timer_on = false

func _process(delta):
	if(timer_on):
		time += delta
		
		var secs = fmod(time,60)
		var mins = fmod(time, 60*60) / 60
		
		var time_passed = "%02d : %02d" % [mins,secs]
		text = time_passed
		
		if(time_passed == "00 : 01"):
			get_tree().change_scene("res://Menu/Ending/end.tscn");
		pass


func _ready():
	timer_on = true
	pass



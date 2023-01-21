extends KinematicBody2D

var velocity = Vector2(0,0)
var speed = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	move_coustomer()
	pass
func move_coustomer():
	velocity.x = speed
	velocity.y -= 0
	velocity = move_and_slide(velocity, Vector2.UP)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	#queue_free()
	pass # Replace with function body.

extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 1000
var velocity = Vector2.ZERO
var isSprinting = false
var money = 0
onready var animationPlayer = $AnimationPlayer

enum {
	STAY,
	CROUCH,
	WALK
}
var state = STAY

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
#	Input.is_action_pressed()
	if input_vector != Vector2.ZERO:
		state = WALK
	else:
		state = STAY
	
	match state:
		STAY:
			animationPlayer.play("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		WALK:
			#animation logic
			animationPlayer.play("Walk")
			#sprinting logic
			isSprinting = Input.is_action_pressed("ui_sprint")
			if Input.is_action_just_released("ui_sprint"):
				isSprinting = false
			
			if isSprinting:
				velocity = velocity.move_toward(input_vector * MAX_SPEED * 2, ACCELERATION * delta)
			else:
				velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
				
	velocity = move_and_slide(velocity)

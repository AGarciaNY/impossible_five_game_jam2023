extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 100
const FRICTION = 800
var velocity = Vector2.ZERO
var isSprinting = false
var isCrouching = false
var money = 0

var score = 0

onready var animationPlayer = $AnimationPlayer

enum {
	STAY,
	CROUCH,
	WALK
}
var state = STAY
func _ready():
	$Camera2D/RichTextLabel.text = str(score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	#sprinting logic
	isSprinting = Input.is_action_pressed("ui_sprint")
	isCrouching = Input.is_action_pressed("ui_crouch")

	if isCrouching:
		state = CROUCH
	elif input_vector != Vector2.ZERO:
		state = WALK
	else:
		state = STAY
	
	match state:
		STAY:
			animationPlayer.play("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		CROUCH:
			if Input.is_action_just_released("ui_sprint"):
				isSprinting = false
			if Input.is_action_just_pressed("ui_crouch"):
				animationPlayer.play("Crouch")
			if Input.is_action_just_released("ui_crouch"):
				isCrouching = false
			
			if isSprinting:
				velocity = velocity.move_toward(input_vector * MAX_SPEED * .8, ACCELERATION * delta)
			else:
				velocity = velocity.move_toward(input_vector * MAX_SPEED * .5, ACCELERATION * delta)
		WALK:
			#animation logic
			animationPlayer.play("Walk")
			if Input.is_action_just_released("ui_sprint"):
				isSprinting = false
			
			if isSprinting:
				velocity = velocity.move_toward(input_vector * MAX_SPEED * 2, ACCELERATION * delta)
			else:
				velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
				
	velocity = move_and_slide(velocity)


func _on_Node2_orderFinishedGetPoints():
	score += 5
	$Camera2D/RichTextLabel.text = str(score)
	pass # Replace with function body.

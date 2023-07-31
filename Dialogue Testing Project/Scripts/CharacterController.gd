extends CharacterBody3D


@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5

@onready var camera_position:Camera3D = $Camera3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
# Get the camera sensitivity from project settings
var camera_sensitivity = ProjectSettings.get_setting("player/camera_sensitivity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

	# Hides or shows mouse depending on if escape is pressed
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
		
# Handle camera rotation
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * camera_sensitivity)
		camera_position.rotate_x(-event.relative.y * camera_sensitivity)
		# Clamp camera rotation to stop from 'overlooking' up or down
		camera_position.rotation.x = clamp(camera_position.rotation.x, -PI/2, PI/2)

extends RigidBody3D

@export var camera: Camera3D;
const force = 40;
const max_velocity = 10;
var velo = 0;

func _physics_process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	var camera_forward = (camera.global_transform.basis * Vector3.FORWARD).normalized()
	var camera_right = (camera.global_transform.basis * Vector3.RIGHT).normalized()
	camera_forward.y = 0
	camera_right.y = 0
	
	var direction = (camera_right * input_dir.x) + (camera_forward * input_dir.y)
	apply_central_force(direction.normalized() * force * delta * 20)  # Adjust multiplier
	
	velo += delta;
	if velo >= 0.5: 
		print(self.linear_velocity.length());
		velo = 0;

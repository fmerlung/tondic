extends RigidBody3D

const force = 40;
const max_velocity = 10;

func _physics_process(delta) -> void:
	if Input.is_action_pressed("ui_up") and self.linear_velocity.z > -max_velocity:
		self.apply_force(Vector3(0, 0, -force));
	if Input.is_action_pressed("ui_down") and self.linear_velocity.z < max_velocity:
		self.apply_force(Vector3(0, 0, force));
	if Input.is_action_pressed("ui_left") and self.linear_velocity.x > -max_velocity:
		self.apply_force(Vector3(-force, 0, 0));
	if Input.is_action_pressed("ui_right") and self.linear_velocity.x < max_velocity:
		self.apply_force(Vector3(force, 0, 0));

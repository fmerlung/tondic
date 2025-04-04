extends Camera3D

@export var lerp_speed = 3.0
@export var target: Node3D
@export var offset = Vector3(0, 2, -5)  # Example: Camera above and behind the ball

func _physics_process(delta):
    if !target:
        return
    
    # Track the ball's POSITION (ignoring its rotation)
    var target_position = target.global_position + offset
    global_position = global_position.lerp(target_position, lerp_speed * delta)
    
    # Always look at the ball's center, using WORLD UP (Vector3.UP)
    look_at(target.global_position, Vector3.UP)
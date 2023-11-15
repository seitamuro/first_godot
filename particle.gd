extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func start(pos):
	emitting = true
	position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if emitting == false:
		queue_free()

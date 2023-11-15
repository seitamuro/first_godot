extends Area2D

var Particle = preload("res://particle.tscn")

# 画面サイズ
var screen:Rect2

# 移動速度
var velocity:Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	# 画面サイズ取得
	screen = get_viewport_rect()
	
	velocity.x = randi_range(-300, 300)
	velocity.y = randi_range(-300, 300)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
	
	if position.x < 0:
		position.x = 0
		velocity.x *= -1
	if position.y < 0:
		position.y = 0
		velocity.y *= -1
	if position.x > screen.size.x:
		position.x = screen.size.x
		velocity.x *= -1
	if position.y > screen.size.y:
		position.y = screen.size.y
		velocity.y *= -1


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			queue_free()
			
			var p = Particle.instantiate()
			p.start(position)
			var root_node = get_parent()
			root_node.add_child(p)

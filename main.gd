extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var all_destroyed = true
	
	for node  in get_children():
		if "Enemy" in node.name:
			all_destroyed = false
	
	if all_destroyed:
		OS.alert("ゲームクリア!")
		
		get_tree().quit()

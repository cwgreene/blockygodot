extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var pos = get_viewport().get_mouse_position()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#print(position-pos)
		var dist = position - pos
		var norm = dist/dist.length()**2
		var force = 1000*norm/(dist.length()/500+.1)**2
		self.apply_force(force)

func _process(delta):
	queue_redraw()

func _draw():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var pos = to_local(get_viewport().get_mouse_position())
		draw_line(pos, Vector2(0,0), Color(0,0,0), 5)
	

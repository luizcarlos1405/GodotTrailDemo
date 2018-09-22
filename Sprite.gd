extends Sprite

var trail_length = 50
var point_speed = 20
var direction = Vector2(-1,0)
var time = 0

func _ready():
	$Line2D.set_as_toplevel(true)
	pass

func _physics_process(delta):
	time += delta * 20
	set_global_position(get_global_mouse_position())
	
	for point in $Line2D.get_points():
		point += direction * point_speed + sin(time) * Vector2(0, 10)
#		$Line2D.set_point_position(point_number, $Line2D.get_point_position(point_number) + direction * point_speed + sin(time) * Vector2(0, 10))
		pass
	
	$Line2D.add_point(get_global_position())
	
	while($Line2D.get_point_count() > trail_length):
		$Line2D.remove_point(0)
	
	pass

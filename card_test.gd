extends Node3D

@onready var card = $"Card Root/Card Hover/Card Flip Lift/Card Visible"
var is_tapped = false
var tap_speed = 10
var tap_target = float(.25 * PI)
@onready var flip_lift = $"Card Root/Card Hover/Card Flip Lift"
var is_flipped = false
var flip_speed = 5
var flip_target = float(PI)
var lift_height = .03
@onready var hover = $"Card Root/Card Hover"
var is_hovering = false
var hover_speed = 10
var hover_height = .02
var non_hover_height = .01

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Lerp to the new tap pose
	if is_tapped == true:
		card.rotation.y = lerp(card.rotation.y, tap_target, delta * tap_speed)
	else:
		card.rotation.y = lerp(card.rotation.y, float(0), delta * tap_speed)
	
	# Lerp to the new flip pose
	if is_flipped == true:
		card.rotation.z = lerp(card.rotation.z, flip_target, delta * flip_speed)
	else:
		card.rotation.z = lerp(card.rotation.z, float(0), delta * flip_speed)
	
	# Lift the card when flipping
	flip_lift.position.y = sin(card.rotation.z) * lift_height
	
	# Lidt the card to the new Hover pose
	if is_hovering == true:
		hover.position.y = lerp(hover.position.y, hover_height, delta * hover_speed)
	else:
		hover.position.y = lerp(hover.position.y, non_hover_height, delta * hover_speed)

func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed == true:
			is_tapped = !is_tapped
		if event.button_index == MOUSE_BUTTON_LEFT and event.double_click == true:
			is_flipped = !is_flipped

func _on_area_3d_mouse_entered() -> void:
	is_hovering = true

func _on_area_3d_mouse_exited() -> void:
	is_hovering = false

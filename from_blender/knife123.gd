extends Node3D



# Reference to the AnimationPlayer node
var animation_player: AnimationPlayer
var already_on_scissor: bool = false
var already_on_knife: bool = false
var power_up1: MeshInstance3D
var power_up2: MeshInstance3D



func _ready():
	# Get the AnimationPlayer node named "AnimationPlayer" in the scene
	animation_player = get_node("AnimationPlayer")
	power_up1 = get_node("Line001/power_up1")
	power_up1.visible = false
	power_up2 = get_node("Line001/power_up2")
	power_up2.visible = false


func _input(event: InputEvent):

	if event is InputEventKey:
		var key_event = event as InputEventKey
		# prees 'P1 to show / hide "power_up1"
		if key_event.keycode == KEY_P and key_event.pressed:
			power_up1.visible = !power_up1.visible
		# press '1' to open/close scissor
		if key_event.keycode == KEY_1 and key_event.pressed:
			# Play the "scissors" animation if it exists
			if animation_player.has_animation("scissors") and already_on_scissor == false:
				animation_player.play("scissors")
				animation_player.play_backwards("knife")
				already_on_scissor = true
			elif animation_player.has_animation("scissors") and already_on_scissor == true:
				animation_player.play_backwards("scissors")
				already_on_scissor = false
		# press '2' to open/close knife
		if key_event.keycode == KEY_2 and key_event.pressed:
			# Play the "knife" animation if it exists
			if animation_player.has_animation("knife") and already_on_knife == false:
				animation_player.play("knife")
				already_on_knife = true
			elif animation_player.has_animation("knife") and already_on_knife == true:
				animation_player.play_backwards("knife")
				already_on_knife = false
			
		


		


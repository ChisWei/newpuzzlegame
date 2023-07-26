extends Node3D





func _on_area_3d_body_entered(body):
	if body is CharacterBody3D:
		$AnimationPlayer.play("Open")





func _on_area_3d_body_exited(body):
	if body is CharacterBody3D:
		$AnimationPlayer.play_backwards("Open")

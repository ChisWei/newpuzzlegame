extends MeshInstance3D

@export var flash_duration: float = 0.5
var flash_timer: float = 0.0
var flashing: bool = false

func _ready():
	# Create a material and override the material of the MeshInstance3D
	var material_instance = StandardMaterial3D.new()
	#material_instance.emission_enabled = true
	material_instance.albedo_color = Color(0,0,0)
	material_override = material_instance
	#set_process(true)

func _process(delta: float):
	flash_timer += delta

	if flash_timer > flash_duration:
		flash_timer = 0.0
		flashing = !flashing

	# Set the emission color to simulate flashing
	if flashing:
		material_override.albedo_color = Color(1.0, 0.0, 0.0)
	else:
		material_override.albedo_color = Color(0.0, 1.0, 0.0)



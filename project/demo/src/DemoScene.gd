extends Node


func _ready():
	if has_node("UI"):
		$UI.player = $Player

func _input(event):
	if event.is_action("test") && event.is_pressed():
		var terrain: Terrain3D = $Terrain3D
		var storage: Terrain3DStorage = terrain.storage
		var h = storage.get_height($Player.global_position)
		storage.set_height($Player.global_position, h + 1)
		storage.force_update_maps(Terrain3DStorage.TYPE_HEIGHT)
		
		#terrain.collision_enabled = false
		#terrain.collision_enabled = true
		terrain.regenerate_collision($Player.global_position)

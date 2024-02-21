extends Node


func _ready():
	if has_node("UI"):
		$UI.player = $Player

func _input(event):
	if event.is_action("test"):
		var storage: Terrain3DStorage = $Terrain3D.storage
		var h = storage.get_height($Player.global_position)
		storage.set_height($Player.global_position, h + 1)
		storage.force_update_maps(Terrain3DStorage.TYPE_HEIGHT)
		
		$Terrain3D.collision_enabled = false
		$Terrain3D.collision_enabled = true

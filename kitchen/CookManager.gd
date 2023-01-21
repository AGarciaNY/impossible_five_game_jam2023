extends Node2D
onready var pantry = get_node("../CanvasLayer/PantrySelection")

#Shows Pantry
func _on_Area2D_area_entered(_area):
	pantry.visible = true

#hide Pantry
func _on_Area2D_area_exited(area):
	pantry.visible = false
	

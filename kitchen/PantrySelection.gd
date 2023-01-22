extends Control
var foodData
var inventory
onready var inventoryContainer = $Inventory/ScrollContainer/VBoxContainer

func _ready():
	foodData = get_node("/root/FoodData")
	inventory = get_node("/root/Inventory")

func isInventryFull():
	return inventory.inventory.size() >= 12

func occupyEmpty(item, name):
	if !isInventryFull():
		inventory.inventory.push_back(name)
	#	getting the rows of food
		var rows = inventoryContainer.get_children()
		var count = 0
		while count < rows.size():
			var row = rows[count]
			var rowChildIndex = 0
			while rowChildIndex < 3:
				var inventorySpaces = row.get_children()
				var inventorySpace = inventorySpaces[rowChildIndex]
				var hasTexture = is_instance_valid(inventorySpace.get_node('TextureRect').texture)
				if !hasTexture:
					inventorySpace.get_node('TextureRect').texture = load(item)
					return
				rowChildIndex += 1
			count += 1
	else:
		return

func _on_Cold_Spegetti_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/94_spaghetti.png", "spagetti")

func _on_Meatball_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/69_meatball.png","meatball")

func _on_Steak_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/95_steak.png", "steak")

func _on_Egg_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/40_eggsalad.png", "egg")

func _on_Bread_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/07_bread.png", "bread")

func _on_Garlic_Bread_button_up():
	occupyEmpty("res://jam assets/Foods/Food_Assets/48_garlicbread.png", "garlic bread")


func _on_Ginger_Breadman_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/52_gingerbreadman.png", "gingerbread man")

func _on_Loaf_Bread_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/65_loafbread.png", "loaf bread")


func _on_Cake_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/90_strawberrycake.png", "cake")


func _on_Cake2_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/22_cheesecake.png", "cake")


func _on_Cake3_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/30_chocolatecake.png", "cake")


func _on_Cake4_button_down():
	occupyEmpty("res://jam assets/Foods/Food_Assets/46_fruitcake.png", "cake")

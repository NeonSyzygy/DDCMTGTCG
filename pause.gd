extends Control

@onready var parent = $"../"
@onready var mainMenu = $"../../Menu"

func _on_resume_pressed() -> void:
	parent.pauseMenu()

func _on_main_menu_pressed() -> void:
	get_node("../../Menu").show()
	parent.queue_free()

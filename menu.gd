extends Control

func _on_card_test_pressed() -> void:
	var cardTestScene = preload("res://Card Test.tscn")
	var cardTestSceneInstance = cardTestScene.instantiate()
	$".".add_sibling(cardTestSceneInstance)
	$".".hide()

func _on_quit_pressed() -> void:
	get_tree().quit()

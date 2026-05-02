extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.show_help("أنقر على استعمال (E) عشان تشغل المكينة")
		body.is_inside_machine = true
		body.menu_name = "potions_creation"


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.hide_help()
		body.is_inside_machine = false

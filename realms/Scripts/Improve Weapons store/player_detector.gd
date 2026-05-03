extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.show_help("أنقر على استعمال (E) عشان تسوي سلاح")
		body.is_inside_machine = true
		body.menu_name = "Weapon_store"

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.hide_help()
		body.is_inside_machine = false

extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -400.0

var menu_name: String = "إياد ليزيوم (إياد بالجزائرية معناها زلمة ههههه)"
var is_inside_machine: bool = false

@onready var help: Label = $Help
@onready var anim: AnimatedSprite2D = $Texture

func _ready() -> void:
	help.visible = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Use") and is_inside_machine:
		show_current_menu()

	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	
	if direction_y < 0:
		anim.play("Walking Up")
	else:
		anim.play("Idle Up")

	if direction_y > 0:
		anim.play("Walking Down")
	else:
		anim.play("Idle down")


	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#دالة تظهر المينيو الحالي
func show_current_menu():
	var current_menu = load(str("res://Scenes/Menus/" + menu_name + ".tscn"))
	var instantiated_menu = current_menu.instantiate()
	$"../CanvasLayer/Menu parent".add_child(instantiated_menu)

#دالة كتبتها أنا عشان تظهر المساعدة
func show_help(text: String):
	help.visible = true
	help.text = text

func hide_help():
	help.visible = false

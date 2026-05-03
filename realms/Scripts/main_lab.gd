extends Node2D

@onready var mini_map_viewport: SubViewport = $CanvasLayer/SubViewportContainer/SubViewport
@onready var mini_map_camera: Camera2D = $CanvasLayer/SubViewportContainer/SubViewport/Camera2D
@onready var player: CharacterBody2D = $Player

func _ready() -> void:
	mini_map_viewport.world_2d = get_viewport().world_2d
	mini_map_viewport.transparent_bg = true

func _process(delta: float) -> void:
	if player:
		mini_map_camera.global_position = player.global_position

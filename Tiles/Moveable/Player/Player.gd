class_name Player
extends "res://tiles/moveable/moveable.gd"

var enabled := true
var _movement_dictionary: Dictionary

func _process(_delta) -> void:
	for key_press in _movement_dictionary:
		if Input.is_action_pressed(key_press):
			var _did_move = move(_movement_dictionary[key_press])
		if Input.is_action_just_released(key_press):
			stop()

func handle_collision(collider: Node2D, direction: Vector2) -> bool:
	if collider.is_in_group("Doors"):
		if collider.is_open:
			enabled = false
			$AudioCorrect.play()
			move_tween(direction)
			return true
		else:
			$AudioWrong.play()
	return .handle_collision(collider, direction)

func _on_Tween_tween_all_completed() -> void:
	if not enabled:
		var game = find_parent("Game")
		if not game.has_players():
			game.next_room()
		queue_free()
class_name Player
extends CharacterBody2D


const LEFT: StringName = "left"
const RIGHT:StringName = "right"
const UP: StringName = "up"
const DOWN: StringName = "down"
const SPEED: float = 150.0
const ACCELERATION: float = -25

var input_direction: Vector2 = Vector2.ZERO


func _process(delta: float) -> void:
    input_direction = Input.get_vector(LEFT, RIGHT, UP, DOWN)

    velocity = velocity.lerp(input_direction * SPEED, 1 - exp(ACCELERATION * delta))
    move_and_slide()

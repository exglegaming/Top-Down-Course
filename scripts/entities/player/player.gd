class_name Player
extends CharacterBody2D


const LEFT: StringName = "left"
const RIGHT:StringName = "right"
const UP: StringName = "up"
const DOWN: StringName = "down"
const IDLE_DOWN: StringName = "idle_down"
const IDLE_LEFT: StringName = "idle_left"
const IDLE_RIGHT: StringName = "idle_right"
const IDLE_UP: StringName = "idle_up"
const RUN_DOWN: StringName = "run_down"
const RUN_LEFT: StringName = "run_left"
const RUN_RIGHT: StringName = "run_right"
const RUN_UP: StringName = "run_up"
const SPEED: float = 150.0
const ACCELERATION: float = -25

var input_direction: Vector2 = Vector2.ZERO
var facing_direction: String = "down"
var animation_to_play: String

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _process(delta: float) -> void:
    input_direction = Input.get_vector(LEFT, RIGHT, UP, DOWN)

    velocity = velocity.lerp(input_direction * SPEED, 1 - exp(ACCELERATION * delta))
    move_and_slide()

    if velocity.length() > 20:
        animation_to_play = "run_%s" % get_direction_name()
    else:
        animation_to_play = "idle_%s" % get_direction_name()
    
    animated_sprite_2d.play(animation_to_play)


func get_direction_name() -> String:
    if input_direction == Vector2.ZERO:
        return facing_direction
    
    if input_direction.y > 0:
        facing_direction = "down"
    elif input_direction.y < 0:
        facing_direction = "up"
    else:
        if input_direction.x > 0:
            facing_direction = "right"
        elif input_direction.x < 0:
            facing_direction = "left"
    
    return facing_direction

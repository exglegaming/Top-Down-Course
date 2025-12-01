class_name Grass
extends Area2D


var skew_tween: Tween
var skew_tween_back: Tween

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var back_sprite_2d: Sprite2D = $BackSprite2D


func _ready() -> void:
    var start_skew: float = deg_to_rad(randf_range(-10, 10))
    var end_skew: float = -start_skew

    skew_tween = create_tween().set_loops()
    skew_tween.tween_property(sprite_2d, "skew", end_skew, 1.5).from(start_skew)
    skew_tween.tween_property(sprite_2d, "skew", start_skew, 1.5).from(end_skew)
    skew_tween.set_ease(Tween.EASE_IN_OUT)

    var start_skew_back: float = end_skew * 0.5
    var end_skew_back: float = -start_skew_back

    skew_tween_back = create_tween().set_loops()
    skew_tween_back.tween_property(back_sprite_2d, "skew", end_skew_back, 1.5).from(start_skew_back)
    skew_tween_back.tween_property(back_sprite_2d, "skew", start_skew_back, 1.5).from(end_skew_back)
    skew_tween_back.set_ease(Tween.EASE_IN_OUT)

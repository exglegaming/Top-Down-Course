extends Sprite2D


@export var random_regions: Array[Rect2]


func _ready() -> void:
    update_random_region()


func update_random_region() -> void:
    var random_index: int = randi_range(0, random_regions.size() - 1)
    region_rect = random_regions[random_index]

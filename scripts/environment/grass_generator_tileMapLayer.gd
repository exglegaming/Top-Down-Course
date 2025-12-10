extends TileMapLayer


const GRASS: PackedScene = preload("uid://ut3dwluae8vw")
const OFFSET: float = 10.0


func _ready() -> void:
    enabled = false

    var cell_array: Array[Vector2i] = get_used_cells()
    for cell_coordinate: Vector2i in cell_array:
        var new_grass: Node = GRASS.instantiate()
        new_grass.global_position = global_position + cell_coordinate * 32.0 + Vector2(16.0, 16.0)
        get_parent().add_child.call_deferred(new_grass)

        var random_offset: Vector2 = Vector2(randf_range(-OFFSET, OFFSET), randf_range(-OFFSET, OFFSET))
        new_grass.global_position += random_offset

        new_grass.get_node("Sprite2D").flip_h = randi_range(0, 1)
        new_grass.get_node("BackSprite2D").flip_h = randi_range(0, 1)

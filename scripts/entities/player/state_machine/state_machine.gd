class_name StateMachine
extends Node


var current_state: BaseState


func _ready() -> void:
    for child: Node in get_children():
        var child_state: BaseState = child as BaseState
        child_state.parent_state_machine = self
        child_state.ready()

    current_state = get_child(0)
    current_state.enter()


func _physics_process(delta: float) -> void:
    current_state.update_physics(delta)


func _process(_delta: float) -> void:
    current_state.update()

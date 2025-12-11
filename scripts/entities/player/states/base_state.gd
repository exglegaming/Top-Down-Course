class_name BaseState
extends Node


var parent_state_machine: StateMachine


@warning_ignore("unused_parameter")
func update_physics(delta: float) -> void:
    # print("%s is updating physics" % name)
    pass


func update() -> void:
    # print("%s is updating" % name)
    pass


func enter() -> void:
    pass


func exit() -> void:
    pass


func ready() -> void:
    pass

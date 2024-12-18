@tool
extends Control

@export var newCondition: Button
@export var conditionHolder: ScrollContainer
var condition: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	newCondition.pressed.connect(addCondition)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func addCondition() -> void:
	condition = Button.new()
	conditionHolder.add_child(condition)
	condition.set_text("nice")

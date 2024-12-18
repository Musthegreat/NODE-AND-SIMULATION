@tool
extends EditorPlugin

const main: PackedScene = preload("simulation.tscn")
const Simulation: PackedScene = preload("res://addons/simulation/menu.tscn")
var mainInstance
var menuInstance

func _enter_tree() -> void:
	mainInstance = main.instantiate()
	menuInstance = Simulation.instantiate()
	EditorInterface.get_editor_main_screen().add_child(mainInstance)
	_make_visible(false)
	
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_UL, menuInstance)
	
func _exit_tree() -> void:
	if mainInstance:
		mainInstance.queue_free()
		
	remove_control_from_docks(menuInstance)
	menuInstance.queue_free()

func _make_visible(visible: bool) -> void:
	if mainInstance:
		mainInstance.visible = visible

func _has_main_screen() -> bool:
	return true

func _get_plugin_name() -> String:
	return "SIMULATION"

func _get_plugin_icon() -> Texture2D:
	return EditorInterface.get_editor_theme().get_icon("Node", "EditorIcons")

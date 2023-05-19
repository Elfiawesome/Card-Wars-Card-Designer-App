extends Control
class_name RowNode
var MainCon
var rowindex = 0
var RowData = [
	"filename",
	"DefaultName",
	"World",
	"Hp",
	"Atk",
	"Pt",
	"AbilityHere",
	"Type"
]

@onready var file_name = $Panel/HBoxContainer/FileName
@onready var char_name = $Panel/HBoxContainer/Name
@onready var world = $Panel/HBoxContainer/World
@onready var hp = $Panel/HBoxContainer/Hp
@onready var atk = $Panel/HBoxContainer/Atk
@onready var pt = $Panel/HBoxContainer/Pt
@onready var ability = $Panel/HBoxContainer/Ability
@onready var card_type = $Panel/HBoxContainer/CardType

func _ready():
	var _c=0
	file_name.text = RowData[_c];_c+=1
	char_name.text = RowData[_c];_c+=1
	world.text = RowData[_c];_c+=1
	hp.text = RowData[_c];_c+=1
	atk.text = RowData[_c];_c+=1
	pt.text = RowData[_c];_c+=1
	ability.text = RowData[_c];_c+=1
	card_type.text = RowData[_c];_c+=1




func _on_panel_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			var window = load("res://Scenes/ExternalWindows/CardEditWindow/EditCardDataWindow.tscn").instantiate()
			MainCon.add_child(window)

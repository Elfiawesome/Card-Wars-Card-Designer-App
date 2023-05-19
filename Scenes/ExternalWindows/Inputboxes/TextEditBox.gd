extends Control
var Name = ""
var DefaultText = ""

@onready var label = $HBoxContainer/Label
@onready var InputBox = $HBoxContainer/TextEdit


func _ready():
	name = Name + ":"
	label.text = Name
	InputBox.placeholder_text = "Enter "+Name
	

func _process(delta):
	pass

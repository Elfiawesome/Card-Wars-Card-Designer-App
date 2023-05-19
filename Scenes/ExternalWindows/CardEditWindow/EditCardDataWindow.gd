extends Window


# Called when the node enters the scene tree for the first time.
func _ready():
	var containers = [
		"Name",
		"Hp",
		"Atk",
		"Pt",
		"Ability"
	]
	for item in containers:
		var _linedit = load("res://Scenes/ExternalWindows/Inputboxes/LineEditBox.tscn").instantiate()
		_linedit.Name = item
		$Control/Bg/MarginContainer/VBoxContainer.add_child(_linedit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

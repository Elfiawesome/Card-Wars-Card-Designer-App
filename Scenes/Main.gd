extends Control
@onready var table_scroll_bar = $VBoxContainer/HBoxContainer/TableScrollBar
@onready var table = $VBoxContainer/HBoxContainer/Table
@onready var DebugLabel = $DebugLabel

var TableListData = []
var TotalRows = 0
var TotalVisibleRows = 40
var scrolloffset:float = 0
var rscrolloffset:float = 0
var RowInstances: Array[RowNode] = []
var Instance = preload("res://Scenes/TableRow.tscn")

func _ready():
	table_scroll_bar.value_changed.connect(ScrollBarMoved)
	#inti data
	for i in range(50):
		var data = [
			str(i)+": filename",
			"DefaultName",
			"World",
			"Hp",
			"Atk",
			"Pt",
			"AbilityHere",
			"Type"
		]
		TableListData.push_back(data)
	#
	TotalRows = TableListData.size()
	table_scroll_bar.max_value = TotalRows
	_create_new_rows(0)
	#Create the table
	_update_row_pos()


func ScrollBarMoved(value: float):
	scrolloffset = value
	_update_row_pos()

func _update_row_pos():
	_create_new_rows(floor(scrolloffset)-10)

func _create_new_rows(StartingPos):
	for row in RowInstances:
		row.queue_free()
	RowInstances.clear()
	var startpos = StartingPos
	for i in range(TotalVisibleRows):
		if (startpos+i) >= 0:
			if (startpos+i) < TableListData.size():
				var _row = Instance.instantiate()
				_row.rowindex = startpos+i
				_row.RowData = TableListData[startpos+i]
				_row.MainCon = self
				RowInstances.push_back(_row)
				table.add_child(_row)
			else:
				break

func _process(delta):
	#DebugLabel.text = str(RowInstances.size())
	DebugLabel.text = str(table.get_child_count())
	
	#Update scroll
	rscrolloffset = lerp(rscrolloffset,scrolloffset,0.07)
	for row in RowInstances:
		row.position.y = (row.rowindex - rscrolloffset) * 40

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$FileDialog_Open.file_selected.connect(_FileSelected)
	var sprite = Sprite2D.new()
	sprite.name = "SpriteCard"
	$SubViewport.add_child(sprite)
	
	_FileSelected("C:/Users/elfia/Desktop/TestPhoto.png")

func _FileSelected(FilePath: String):
	if FilePath.get_extension() == "PNG" or FilePath.get_extension() == "png":
		print("Valid file")
		var img = Image.new()
		img.load(FilePath)
		$SubViewport/SpriteCard.texture = ImageTexture.create_from_image(img)
		$SubViewport/SpriteCard.centered = false
		$SubViewport.size = $SubViewport/SpriteCard.texture.get_size()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Saving")
		#var file = FileAccess.open("res://ExportImg.png", FileAccess.WRITE)
		#var img = get_viewport().get_texture().get_image()
		var img = $SubViewport.get_texture().get_image()
		img.save_png("res://ExportImg.png")
		#FIleaccess vs DirAcess??/

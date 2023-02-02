extends VFlowContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_paper : float
var current_ink : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	current_paper = $Qty_Paper.value
	current_ink = $Qty_Ink.value
	
	$Data.text = \
		( \
			"DATA: \n" + \
			"Avail. Paper: %05.1f" % [current_paper] + "\n" + \
			"Avail. Ink: %05.1f" % [current_ink] + "\n" \
		)

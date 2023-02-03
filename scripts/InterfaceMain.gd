extends VFlowContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_funds : float = 0

var current_paper : float = 0
var current_ink : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_funds = 500
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	pass
	
#	$Data.text = \
#		( \
#			"DATA: \n" + \
#			"Avail. Paper: %05.1f" % [current_paper] + "\n" + \
#			"Avail. Ink: %05.1f" % [current_ink] + "\n" \
#		)

func _on_Buy_Paper_button_down(): 
	current_funds -= $Options_Paper/Qty_Paper.value
	current_paper += $Options_Paper/Qty_Paper.value
	$Options_Paper/Qty_Paper.value = 0

func _on_Buy_Ink_button_down():
	current_funds -= $Options_Ink/Qty_Ink.value
	current_ink += $Options_Ink/Qty_Ink.value
	$Options_Ink/Qty_Ink.value = 0

func _on_Timer_timeout():
	$Current_Funds.text = "Funds: %0.2f" % [current_funds]


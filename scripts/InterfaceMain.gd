extends VFlowContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_funds : float = 0
var current_paper : float = 0
var current_ink : float = 0
var current_books : float = 0

var funds_to_paper_ratio : float = 1
var funds_to_ink_ratio : float = 1

var ink_to_books_ratio : float = 1
var paper_to_books_ratio : float = 1

var books_to_funds_ratio : float = 5

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
	current_funds -= $Options_Paper/Qty_Paper.value * funds_to_paper_ratio
	current_paper += $Options_Paper/Qty_Paper.value
	$Options_Paper/Qty_Paper.value = 0

func _on_Buy_Ink_button_down():
	current_funds -= $Options_Ink/Qty_Ink.value * funds_to_ink_ratio
	current_ink += $Options_Ink/Qty_Ink.value
	$Options_Ink/Qty_Ink.value = 0


func _on_Make_Books_button_down():
	current_ink -= $Options_Books/Qty_Books.value * ink_to_books_ratio
	current_paper -= $Options_Books/Qty_Books.value * paper_to_books_ratio
	current_books += $Options_Books/Qty_Books.value
	$Options_Books/Qty_Books.value = 0

func _on_Sell_Books_button_down():
	current_books -= $Options_Books/Qty_Books.value
	current_funds += $Options_Books/Qty_Books.value * books_to_funds_ratio

func _on_Timer_timeout():
	$Current_Funds.text = "Funds: %0.2f" % [current_funds]
	$Current_Ink.text = "Ink: %0.2f" % [current_ink]
	$Current_Paper.text = "Paper: %0.2f" % [current_paper]
	$Current_Books.text = "Books: %0.2f" % [current_books]

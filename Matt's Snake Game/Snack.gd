extends Area2D

signal snack_eaten


func _on_Snack_area_entered(area):
	if (area.name == "Head"):
		emit_signal("snack_eaten")

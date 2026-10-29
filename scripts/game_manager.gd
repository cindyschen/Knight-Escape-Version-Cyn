extends Node

var coins_collected: Array[String] = []
var total_coins = 12

var pending_collected: Array[String] = []

var total_collected: int:
	get:
		return coins_collected.size()

func picked_coin(coin_id: String):
	if not coins_collected.has(coin_id):
		pending_collected.append(coin_id)

func complete_level():
	coins_collected += pending_collected
	pending_collected.clear()
	
func reset_attempt():
	pending_collected.clear()
		

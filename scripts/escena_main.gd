extends Node2D
@onready var jugador = $Node2D
@onready var enemy = $Node2D2




func _ready() -> void:
	turno_del_enemigo()
	#turno_del_jugador()

func turno_del_enemigo():
	enemy.esperar_para_atacar()

func turno_del_jugador():
	jugador.procesar_input_ataque()

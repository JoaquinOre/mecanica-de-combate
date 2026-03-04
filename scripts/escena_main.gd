extends Node2D
@onready var jugador = $Node2D
@onready var enemigo = $Node2D2




func _ready() -> void:
	turno_del_enemigo()


func turno_del_enemigo():
	enemigo.esperar_para_atacar()
	if !enemigo.enemyAttack:
		turno_del_jugador()

func turno_del_jugador():
	jugador.Attack()

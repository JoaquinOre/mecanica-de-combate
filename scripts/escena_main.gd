extends Node2D
@onready var jugador = $Node2D
@onready var enemigo = $Node2D2




func _ready() -> void:
	turno_del_enemigo()


func turno_del_enemigo():
	enemigo.enemyAttack = true
	enemigo.preparar_ataque()
	await get_tree().create_timer(3.0).timeout
	enemigo.enemyAttack = false
	turno_del_jugador()

func turno_del_jugador():
	jugador.Attack()

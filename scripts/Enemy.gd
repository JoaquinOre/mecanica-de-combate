extends Node2D
enum Pose { IZQUIERDA, ARRIBA, DERECHA }
@onready var Att_izq = $ColorRect/Attack_izq
@onready var Att_der = $ColorRect/Attack_der
@onready var Att_arr = $ColorRect/Attack_arr
@export var node_2d : Node2D
var enemyAttack = false
var vida = 100
var postura = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ocultar_ataque()


func esperar_para_atacar():
	await get_tree().create_timer(0.7).timeout
	print("preparando el ataque")
	preparar_ataque()

func preparar_ataque():
	var direccion = [Pose.IZQUIERDA, Pose.ARRIBA, Pose.DERECHA].pick_random()
	ocultar_ataque()
	if direccion == Pose.IZQUIERDA:
		Att_izq.visible = true
	if direccion == Pose.DERECHA:
		Att_der.visible = true
	if direccion == Pose.ARRIBA:
		Att_arr.visible = true
	await get_tree().create_timer(0.7).timeout
	evaluar_ataque(direccion)

func evaluar_ataque(dir):
	var blockeo = false
	if dir == Pose.IZQUIERDA and node_2d.escudo_izq.visible:
		blockeo = true
	elif dir == Pose.DERECHA and node_2d.escudo_der.visible:
		blockeo = true
	elif dir == Pose.ARRIBA and node_2d.escudo_arr.visible:
		blockeo = true
	else: 
		node_2d.vida -= 20
		print(node_2d.vida)
	
	ocultar_ataque()
	if enemyAttack == true:
		preparar_ataque()

func ocultar_ataque():
	Att_izq.visible = false
	Att_der.visible = false
	Att_arr.visible = false

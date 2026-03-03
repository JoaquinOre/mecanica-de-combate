extends Node2D
enum Pose { IZQUIERDA, ARRIBA, DERECHA }

var patron_normal = [Pose.IZQUIERDA, Pose.ARRIBA, Pose.DERECHA]
var patron_fuerte = [Pose.ARRIBA,Pose.DERECHA,Pose.ARRIBA]
var indice = 0 
var combo_actual = []
@onready var Att_izq = $ColorRect/Attack_izq
@onready var Att_der = $ColorRect/Attack_der
@onready var Att_arr = $ColorRect/Attack_arr
@export var jugador : Node2D
var enemyAttack = false
var vida = 100
var postura = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ocultar_ataque()


func esperar_para_atacar():
	await get_tree().create_timer(0.7).timeout
	print("preparando el ataque")
	combo_actual = patron_normal
	if indice >= combo_actual.size():
		enemyAttack = false
		indice = 0
	if enemyAttack == true :
		preparar_ataque()


func preparar_ataque():
	var direccion = combo_actual[indice]
	ocultar_ataque()
	if direccion == Pose.IZQUIERDA: Att_izq.visible = true
	if direccion == Pose.DERECHA: Att_der.visible = true
	if direccion == Pose.ARRIBA: Att_arr.visible = true
	await get_tree().create_timer(0.7).timeout
	indice += 1
	evaluar_ataque(direccion)



func evaluar_ataque(dir):
	var blockeo = false
	if dir == Pose.IZQUIERDA and jugador.escudo_izq.visible:
		blockeo = true
		postura +=1
	elif dir == Pose.DERECHA and jugador.escudo_der.visible:
		blockeo = true
		postura +=1
	elif dir == Pose.ARRIBA and jugador.escudo_arr.visible:
		blockeo = true
		postura +=1
	else: 
		jugador.vida -= 20
		print(jugador.vida)
	ocultar_ataque()
	if indice >= combo_actual.size():
		enemyAttack = false
		print(enemyAttack)
		indice = 0
	else:
		preparar_ataque()
	#if postura == 3:
		#enemyAttack = false
		#jugador.contra = true
		#jugador.contra_ataque()

func ocultar_ataque():
	Att_izq.visible = false
	Att_der.visible = false
	Att_arr.visible = false

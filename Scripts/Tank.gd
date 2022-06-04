extends KinematicBody2D

onready var _sprite = $AnimatedSprite
onready var bullet = preload('res://Scenes/Bullet.tscn')

const TOP = Vector2(0,-1)
const RIGHT = Vector2(1,0)
const DOWN = Vector2(0,1)
const LEFT = Vector2(-1,0)

var velocity = Vector2.ZERO
var direction = Vector2.ZERO
var speed = 50
var bullet_speed = 1000

func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("right"):
		velocity = RIGHT
	elif Input.is_action_pressed("left"):
		velocity = LEFT
	elif Input.is_action_pressed("down"):
		velocity = DOWN
	elif Input.is_action_pressed("up"):
		velocity = TOP
		
	direction = velocity
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_pressed("fire"):
		fire()

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = position
	bullet_instance.transform.x = 10
	bullet_instance.rotation_degrees = _sprite.rotation_degrees
	#bullet_instance.apply_impulse(Vector2(2,2), Vector2(bullet_speed, 0).rotated(_sprite.rotation - PI/2))
	get_tree().get_root().add_child(bullet_instance)
	pass

func _ready():
	pass
	
func _process(delta):
	if direction == TOP:
		_sprite.rotation_degrees = 0
	if direction == RIGHT:
		_sprite.rotation_degrees = 90
	if direction == DOWN:
		_sprite.rotation_degrees = 180
	if direction == LEFT:
		_sprite.rotation_degrees = 270
	pass
	if velocity != Vector2.ZERO :
		_sprite.play("Moving")
	else:
		_sprite.stop()
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

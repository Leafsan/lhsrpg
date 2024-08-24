# BaseCharaceter.gd
extends Node2D

class_name BaseCharacter

const LifeStatus = preload("res://LifeStatus.gd")

# Default Character Info
var character_name: String = "Unknown"
var level: int = 35
var rank: int = 1
var hp: int
var mp: int
var fate: int
var max_hp: int = 100
var max_mp: int = 100
var max_fate: int = 1
var hp_growth: int = 0
var mp_growth: int = 0

# attributes list
var base_phy: int = 10
var base_agi: int = 10
var base_wil: int = 10
var base_int: int = 10

# derived attributes list
var der_str: int = 0
var der_end: int = 0
var der_dex: int = 0
var der_qik: int = 0
var der_min: int = 0
var der_pre: int = 0
var der_dis: int = 0
var der_wis: int = 0

# battle status
var physical_damage: int = 0
var magic_damage: int = 0
var restoration: int = 0

var physical_defense: int = 0
var magic_defense: int = 0

var speed: int = 0
var initiative: int = 0

var phy_accuracy: int = 0
var magic_accuracy: int = 0
var evasion: int = 0
var resistance: int = 0

# combat status
var regen: int = 0
var damage_reduction: Dictionary = {
	"physical": 0,
	"magic": 0,
	"radiant": 0,
	"fire": 0,
	"lightning": 0,
	"cold": 0,
	"poison": 0
}
var shield: int = 0

# life status
var life_statuses: Array = []

# bad status
var dazed: bool = false
var rigor: bool = false
var confused: bool = false
var staggered: bool = false
var afflicated: bool = false
var overconfident: bool = false

# check_rank
var rank_athletics: int = 0
var rank_endurance: int = 0
var rank_disable: int = 0
var rank_operation: int = 0
var rank_perception: int = 0
var rank_negotiation: int = 0
var rank_knowledge: int = 0
var rank_analysis: int = 0

# infos
var tags: Array = []
var biography: String = ""
# TODO: race add
#var race:

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = max_hp
	mp = max_mp
	fate = max_fate


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# 라이프 스테이터스 추가
func add_life_status(status_name: String, description: String):
	var status = LifeStatus.new(status_name, description)
	life_statuses.append(status)
	print("Added Life Status: " + status.display_status())

# 라이프 스테이터스 삭제
func remove_life_status(status_name: String):
	for status in life_statuses:
		if status.status_name == status_name:
			life_statuses.erase(status)
			print("Removed Life Status: " + status_name)
			break

# 모든 라이프 스테이터스 출력
func display_life_statuses():
	for status in life_statuses:
		print(status.display_status())

# 경감 수치를 추가하거나 변경하는 메서드
func set_damage_reduction(type: String, value: int) -> void:
	var is_new = not damage_reduction.has(type)
	damage_reduction[type] = value
	if is_new:
		print("New damage reduction type added: " + type + " with value " + str(value))
	else:
		print("Updated damage reduction for " + type + " to " + str(value))


# 경감 수치를 가져오는 메서드
func get_damage_reduction(type: String) -> int:
	if damage_reduction.has(type):
		return damage_reduction[type]
	else:
		print("No reduction found for type: " + type)
		return 0

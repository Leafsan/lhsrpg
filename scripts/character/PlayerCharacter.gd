extends BaseCharacter

class_name PlayerCharacter

const DEFAULT_INVENTORY_SIZE: int = 2

var factory: CharacterFactory

var hate: int = 0

var character_category: String = ""
var character_class: String = ""
var character_race: String = ""
var character_subclass: SubClass

var inventory: Array = []
var inventory_size: int = DEFAULT_INVENTORY_SIZE

var common_skills: Array = []
var battle_skills: Array = []
var general_skills: Array = []
var ex_power: Array = []

func _ready():
    factory = CharacterFactory.new()
    factory.load_data()
    var my_character = factory.create_character("tank", "guardian", "human")

    hp = my_character.max_hp
    mp = my_character.max_mp
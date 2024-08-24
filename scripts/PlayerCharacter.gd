extends BaseCharacter

var character_classes: Dictionary
var character_class: String
var character_race: String
var character_subclass: SubClass

var hate: int = 0

const CHARACTER_RACES_PATH = "res://resources/race.json"
const CHARACTER_CLASSES_PATH = "res://resources/main_classes.json"
const DEFAULT_INVENTORY_SIZE = 2

var inventory: Array = []
var inventory_size: int = DEFAULT_INVENTORY_SIZE

func _ready():
    load_character_classes()

func load_character_races():
    var file = FileAccess.open(CHARACTER_RACES_PATH, FileAccess.READ)
    if file:
        var json_parser = JSON.new()
        var json_data = json_parser.parse(file.get_as_text())
        file.close()

        if json_data.error == OK:
			# Assuming the JSON data is an array of race objects
            var race_data = json_data.result
            for race in race_data:
                var _race_name = race.get("name", "")
                var _race_description = race.get("description", "")
                # Do something with the race data, such as storing it in a dictionary or displaying it
        else:
            print("Failed to parse JSON data: ", json_data.error_string)
    else:
        print("Failed to open file: ", CHARACTER_RACES_PATH)

func load_character_classes():
    var file = FileAccess.open(CHARACTER_CLASSES_PATH, FileAccess.READ)
    if file:
        var json_parser = JSON.new()
        var json_data = json_parser.parse(file.get_as_text())
        file.close()
        
        if json_data.error == OK:
            character_classes = json_data.result
        else:
            print("Failed to parse JSON data: ", json_data.error_string)
    else:
        print("Failed to open file: ", CHARACTER_CLASSES_PATH)

func set_class(c_class: String):
    if character_classes.has(c_class):
        var class_data = character_classes[c_class]
        character_class = c_class
        _set_character_stats(class_data)
    else:
        print("Class not found: ", c_class)

func _set_character_stats(class_data: Dictionary):
    max_hp = class_data.get("max_hp", 0)
    hp = max_hp
    max_mp = class_data.get("max_mp", 0)
    mp = max_mp
    der_str = class_data.get("der_str", 0)
    der_end = class_data.get("der_end", 0)
    der_dex = class_data.get("der_dex", 0)
    der_qik = class_data.get("der_qik", 0)
    der_min = class_data.get("der_min", 0)
    der_pre = class_data.get("der_pre", 0)
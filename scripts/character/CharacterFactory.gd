extends Node

class_name CharacterFactory

const CHARACTER_RACES_PATH = "res://resources/race.json"
const CHARACTER_CLASSES_PATH = "res://resources/class.json"

var races: Dictionary = {}
var classes: Dictionary = {}

func load_data():
    races = load_json_data(CHARACTER_RACES_PATH)
    classes = load_json_data(CHARACTER_CLASSES_PATH)

func load_json_data(path: String) -> Dictionary:
    var file = FileAccess.open(path, FileAccess.READ)
    if file:
        var json_parser = JSON.new()
        var json_data = json_parser.parse(file.get_as_text())
        file.close()
        
        if json_data.error == OK:
            return json_data.result
        else:
            print("Failed to parse JSON data from ", path , ": ", json_data.error_string)
            return {}
    else:
        print("Failed to open file: ", path)
        return {}

func create_character(c_category: String, c_class: String, c_race: String) -> BaseCharacter:
    var new_character = PlayerCharacter.new()

    if races.has(c_race):
        var race_data = races[c_race]

        new_character.base_phy = race_data.get("base_phy", 10)
        new_character.base_agi = race_data.get("base_agi", 10)
        new_character.base_wil = race_data.get("base_wil", 10)
        new_character.base_int = race_data.get("base_int", 10)
        new_character.max_hp = race_data.get("max_hp", 8)
        new_character.max_mp = race_data.get("max_mp", 8)
        new_character.max_fate = race_data.get("max_fate", 1)

    if classes.has(c_category) and classes[c_category].has(c_class):
        var class_data = classes[c_category][c_class]
        # 클래스에 따른 설정 적용
        new_character.max_hp += class_data.get("max_hp", 30)
        new_character.max_mp += class_data.get("max_mp", 30)
        new_character.der_str = class_data.get("der_str", 0)
        new_character.der_end = class_data.get("der_end", 0)
        new_character.der_dex = class_data.get("der_dex", 0)
        new_character.der_qik = class_data.get("der_qik", 0)
        new_character.der_min = class_data.get("der_min", 0)
        new_character.der_pre = class_data.get("der_pre", 0)
        new_character.der_dis = class_data.get("der_dis", 0)
        new_character.der_wis = class_data.get("der_wis", 0)
        new_character.hp_growth = class_data.get("hp_growth", 0)
        new_character.mp_growth = class_data.get("mp_growth", 0)

    new_character.hp = new_character.max_hp
    new_character.mp = new_character.max_mp
    return new_character
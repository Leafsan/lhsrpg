extends Node

class_name TurnManager

const CharacterSorter = preload("../util/CharacterSorter.gd")

var characters = []
var current_turn_index = 0
var current_round = 0

func _ready():
    start_battle()

func start_battle():
    characters.sort_custom(CharacterSorter.sort_by_initiative)
    proceed_turn()

func proceed_turn():
    if current_turn_index < characters.size():
        var current_character = characters[current_turn_index]
        if current_character.is_ai and current_character.is_ai_active:
            current_character.execute_ai_action()
        else:
            show_player_action_ui(current_character)
    else:
        start_new_round()

func show_player_action_ui(character):
    # TODO: Show UI for player action
    pass

func execute_action(action):
    current_turn_index += 1
    proceed_turn()

func start_new_round():
    current_turn_index = 0
    start_battle()
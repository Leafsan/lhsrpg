extends Node2D

class_name BattleField

const Tile = preload("./Tile.gd")

var tile_size = Vector2(8, 8)
var tiles = []
var characters = []

func _ready() -> void:
    setup_battlefield()
    setup_characters()

func setup_battlefield() -> void:
    for y in range(8):
        var row: Array = []
        for x in range(8):
            var tile = Tile.new(Vector2(x, y), null)
            row.append(tile)
        tiles.append(row)
    
func setup_characters():
    for character in characters:
        var initial_tile_position = Vector2(randi() % 8, randi() % 8)
        add_character_to_tile(character, initial_tile_position)

func add_character_to_tile(character, tile_position: Vector2):
    var tile = tiles[tile_position.y][tile_position.x]
    tile["units"].append(character)
    character.position = get_tile_world_position(tile_position)
    print("Added character to tile: ", tile_position)

func get_tile_world_position(tile_position: Vector2) -> Vector2:
    return tile_position * tile_size    

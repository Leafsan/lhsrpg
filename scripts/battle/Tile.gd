extends Node2D

class_name Tile

var tile_position: Vector2
var units: Array = []
var effect: Object

func _init(pos: Vector2, eff: Object):
    tile_position = pos
    effect = eff

func add_unit(unit):
    units.append(unit)
    print("Added unit to tile: ", tile_position)


func remove_unit(unit):
    units.erase(unit)
    print("Removed unit from tile: ", tile_position)
extends Node

enum SkillType {
    COMMON,
    BATTLE,
    GENERAL,
    EXPOWER,    
}

var skill_name: String = ""
var skill_type: SkillType = SkillType.COMMON
var skill_tags: Array = []
var skill_rank: int = 0
var skill_rank_max: int = 1
var skill_timing: String = ""
var skill_check: String = ""
var skill_target: String = ""
var skill_range: String = ""
var skill_hate: int = 0
var skill_description: String = ""
var skill_effect: Object
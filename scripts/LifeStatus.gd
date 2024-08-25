# LifeStatus.gd
# extends Reference  # Reference를 상속하여 가볍고 관리하기 쉬운 객체로 만듭니다.
class_name LifeStatus

# 라이프 스테이터스의 이름과 설명
var status_name: String = ""
var description: String = ""

# 초기화 함수
func _init(name: String, desc: String):
	self.status_name = name
	self.description = desc

# 상태 출력
func display_status() -> String:
	return status_name + ": " + description

extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome traveler! (Press E to continue)"
	,"Here you must rely on your speed and instinct."
	,"You must destroy the targets and defeat the drone before your time runs out!"
	,"Press E to begin your trial."
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")




func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()


func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120 
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()

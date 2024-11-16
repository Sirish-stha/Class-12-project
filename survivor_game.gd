extends Node2D

@onready var score_label: Label = $UI/score
@onready var yourscore: Label = $GameOver/ColorRect/yourscore

var score := 0

func _ready():
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()

func _process(delta: float) -> void:
	score_label.text = "Score: " + str(score) 



func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	#new_mob.killed.connect(_on_enemy_killed)
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_mob()
	
	


func _on_player_health_depleted() -> void:
	yourscore.text = "Your Score: "+ str(score)
	%GameOver.visible = true
	get_tree().paused = true 


func _on_button_pressed() -> void:
	get_tree().paused = false 
	%GameOver.visible = false
	get_tree().reload_current_scene()
	

func _on_homescreen_pressed() -> void:
	get_tree().paused = false 
	#%GameOver.visible = false
	get_tree().change_scene_to_file("res://StartMenu.tscn")

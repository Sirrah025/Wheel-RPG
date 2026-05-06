extends Node2D


signal start_wheel


@export var player_entity: Entity
@export var enemy_entity: Enemy_Entity

var player_move: Move_Data
var enemy_move: Move_Data

var player_first: bool

var player_damage: Damage
var enemy_damage: Damage

@onready var player_menu := %"Player Menu"
@onready var player_moves := %"Player Moves"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var move_range = min(player_entity.moves.size(), 4)
	for i in range(move_range):
		player_moves.add_item(player_entity.moves[i].name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_attacks() -> void:
	if (player_move.speed_priority+1 * player_entity.entity_data.Speed) >= (enemy_move.speed_priority+1 * enemy_entity.entity_data.Speed):
		player_first = true
	else:
		player_first = false
		
	if player_first:
		start_player_attack()
	else:
		enemy_deal_damage()

func start_player_attack() -> void:
	player_damage = Damage.new()
	player_damage.user = player_entity.entity_data
	player_damage.target = enemy_entity.entity_data
	player_damage.move = player_move
	start_wheel.emit()


func finish_round() -> void:
	pass


func enemy_deal_damage() -> void:
	enemy_damage = Damage.new()
	enemy_damage.user = enemy_entity.entity_data
	enemy_damage.target = player_entity.entity_data
	enemy_damage.move = enemy_move
	player_entity.HP - enemy_damage.get_total_damage()
	if !player_first:
		start_player_attack()
	else:
		finish_round()


func _on_wheel_new_dir_chosen(payload: RefCounted) -> void:
	var damage_increase = payload.slice_value
	match enemy_entity.entity_data.resistances[payload.damage_type]:
		GlobalEnums.Resistance.WEAK:
			damage_increase *= 2
		GlobalEnums.Resistance.NEUTRAL:
			pass
		GlobalEnums.Resistance.RESISTANT:
			damage_increase = max(damage_increase/2, 1)
	player_damage.damage_amount += payload.slice_value


func _on_wheel_puzzle_finished() -> void:
	enemy_entity.HP - player_damage.get_total_damage()
	if player_first:
		enemy_deal_damage()
	else:
		finish_round()


func _on_player_moves_item_activated(index: int) -> void:
	player_move = player_entity.moves[index]
	enemy_move = enemy_entity.select_move()
	start_attacks()

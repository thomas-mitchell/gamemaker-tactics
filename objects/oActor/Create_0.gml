/// @description Insert description here
grid_x = 0;
grid_y = 0;

army = BLUE_ARMY;

// Character statistics /////////////////////////////
name = "Error";
race = "Human";
size = 0;
wildcard = false;
wounds = 0;
max_wounds = 0;
shaken = false;
// Attributes
attribute_agility_die = 4;
attribute_agility_bonus = 0;	// For attributes above d12
attribute_smarts_die = 4;
attribute_smarts_bonus = 0;
attribute_spirit_die = 4;
attribute_spirit_bonus = 0;
attribute_strength_die = 4;
attribute_strength_bonus = 0;
attribute_vigor_die = 4;
attribute_vigor_bonus = 0;
// Skills
skill_fighting_die = 0;
skill_fighting_bonus = 0;	// For skills over d12
skill_shooting_die = 0;
skill_shooting_bonus = 0;

// Movement and action variables
pace = 6;
actions = 2;
can_act = false;

// Attack variables
attack_target = noone;
attack_timer = 0;

// Initiative
initiative_card = noone;

// State machine
state_machine = new StateMachine();
var _initial_state = new StateActorIdle();
state_machine.swap(_initial_state);

// Pathfinding variables
movement_path = path_add();
path_set_kind(movement_path, 2);
path_set_closed(movement_path, false);
move_speed = 8;

// Derived attributes methods
get_parry = function() {
	return (skill_fighting_die / 2) + 2 + floor(skill_fighting_bonus / 2);	
}
get_toughness = function() {
	return (attribute_vigor_die / 2) + 2 + floor(attribute_vigor_bonus / 2);	
}

// Attribute rolling methods
function roll_attribute(_attribute_die, _attribute_bonus) {
	var _attribute_die_roll = irandom_range(1, _attribute_die);
	if (!wildcard) {
		return _attribute_roll + _attribute_bonus;
	} else {
		var _wild_die_roll = irandom_range(1, 6);
		var _max_roll = max(_attribute_die_roll, _wild_die_roll);
		return _max_roll + _attribute_bonus;
	}
}
roll_attribute_agility = function() {
	return roll_attribute(attribute_agility_die, attribute_agility_bonus);
}
roll_attribute_smarts = function() {
	return roll_attribute(attribute_smarts_die, attribute_smarts_bonus);
}
roll_attribute_spirit = function() {
	return roll_attribute(attribute_spirit_die, attribute_spirit_bonus);
}
roll_attribute_strength = function() {
	return roll_attribute(attribute_strength_die, attribute_strength_bonus);
}
roll_attribute_vigor = function() {
	return roll_attribute(attribute_vigor_die, attribute_vigor_bonus);
}

// Skill rolling methods
function roll_skill(_skill_die, _skill_bonus) {
	var _skill_die_roll = 0;
	if (_skill_die > 0) {
		_skill_die_roll = irandom_range(1, _skill_die) + _skill_bonus;	
	} else {
		_skill_die_roll = irandom_range(1, 4) - 2;
	}
	
	if (!wildcard) {
		return _skill_die_roll;
	} else {
		var _wild_die_roll = 0;
		if (_skill_die > 0) {
			_wild_die_roll = irandom_range(1, 6) + _skill_bonus;	
		} else {
			_wild_die_roll = irandom_range(1, 6) - 2;
		}
		return max(_skill_die_roll, _wild_die_roll);
	}
}
roll_skill_fighting = function() {
	return roll_skill(skill_fighting_die, skill_fighting_bonus);
}
roll_skill_shooting = function() {
	return roll_skill(skill_shooting_die, skill_shooting_bonus);	
}

// Inventory management
inventory = [];
equip_main_hand = noone;
equip_off_hand = noone;

equip_weapon = function(_weapon) {
	equip_main_hand = _weapon;	// This will do for now	
}
/// @description Insert description here

// status of the attack "miss", "hit" or "crit"

// damage and damage type
damage = 0;
damage_type = "piercing";

target = noone;

// owner who made the attack
owner = noone;

// path information
movement_path = path_add();
path_set_closed(movement_path, false);
path_set_kind(movement_path, 2);


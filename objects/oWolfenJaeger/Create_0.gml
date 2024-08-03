/// @description Insert description here
event_inherited();

name = "Wolfen Jaeger";
race = "Human";
// Attributes
attribute_agility_die = 8;
attribute_smarts_die = 6;
attribute_spirit_die = 6;
attribute_strength_die = 8;
attribute_vigor_die = 8;
// Skills
skill_fighting_die = 8;
skill_shooting_die = 8;

// Inventory
array_push(inventory, new Weapon("Fists"));
equip_weapon(inventory[0]);
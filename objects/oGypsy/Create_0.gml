/// @description Insert description here
event_inherited();

name = "Gypsy";
race = "Human";
// Attributes
attribute_agility_die = 6;
attribute_smarts_die = 6;
attribute_spirit_die = 8;
attribute_strength_die = 6;
attribute_vigor_die = 6;
// Skills
skill_fighting_die = 6;

// Inventory
array_push(inventory, new Weapon("Fists"));
equip_weapon(inventory[0]);

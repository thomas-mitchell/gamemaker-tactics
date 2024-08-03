// Script assets have changed for v2.3.0 see
//enum IMPROVISED_WEAPON_TYPE {
//	LIGHT = 4,
//	MEDIUM = 6,
//	HEAVY = 8
//}

function Weapon(_name) constructor {
	name = _name;
	// Types
	is_melee = true;
	is_ranged = false;
	is_improvised_melee = false; // TODO for later use
	// Damage
	damage_melee_die_type = 4;
	damage_melee_die_number = 1
	damage_melee_bonus = 0;
	damage_ranged_die_type = 4;
	damage_ranged_die_number = 1;
	damage_ranged_bonus = 0;
	// Range
	range_short = 0;
	range_medium = 0;
	range_long = 0;
	
	switch(_name) {
		case "Fists":
			damage_melee_die_number = 0; // Unarmed attackers do only strength damage
			break;
		// Base "Pistol" from Rippers - The Horror Wars
		case "Pistol":
			is_melee = true;
			is_ranged = true;
			damage_ranged_die_number = 2; // 2d6+1 damage
			damage_ranged_die_type = 6;
			damage_ranged_bonus = 1;
			range_short = 12;
			range_medium = 24;
			range_long = 48;
			break;
		
		// Base "Shotgun" from Rippers - The Horror Wars
		// NOTE - Will need to support variable damage based on range
		//case "Shotgun":
			
		default:
			show_debug_message("Trying to create unknown weapon: " + _name);
			_weapon = noone;
			break;
	}
	
	roll_attack_melee = function(_attacker, _target) {
		return _attacker.roll_skill_fighting();
	}
	
	roll_attack_ranged = function(_attacker, _target) {
		return _attacker.roll_skill_shooting();
	}
	
	roll_damage_melee = function(_attacker, _target) {
		var _total = 0;
		for (var _index=0; _index<damage_melee_die_number; _index++) {
			total += irandom_range(1, damage_melee_die_number);
		}
		total += damage_melee_bonus;
		
		// Add strength bonus (no wild die)
		total += irandom_range(1, _attacker.attribute_strength_die) + _attacker.attribute_strength_bonus;
		
		return total;
	}
	
	roll_damage_ranged = function(_attacker, _target) {
		var _total = 0;
		for (var _index=0; _index<damage_ranged_die_number; _index++) {
			total += irandom_range(1, damage_ranged_die_number);
		}
		total += damage_ranged_bonus;
		
		return total;
	}
}
// Script assets have changed for v2.3.0 see
enum ATTACK_TYPE {
	RANGED,
	MELEE
}

function StateActorAttack(_attacker, _target, _attack_type): State() constructor {
	attacker = _attacker;
	target = _target;
	attack_type = _attack_type
	
	update = function() {
		switch(attack_type) {
			case ATTACK_TYPE.RANGED:
				// Make attack roll
				var _attack_roll = attacker.equip_main_hand.roll_attack_ranged(attacker, target);
				
				// Determine attack success
				var _attack_raises = scr_calculate_roll_results(4, _attack_roll);
				if (_attack_raises > 0) {
					var _attack_status = "crit";	
				} else if (_attack_raises == 0) {
					var _attack_status = "hit";	
				} else {
					var _attack_status = "miss";	
				}
				
				// Make damamge roll
				var _temp_damage = 0;
				if (_attack_status != "miss") {
					_temp_damage = attacker.equip_main_hand.roll_damage_ranged(attacker, target);
					
					if (_attack_status == "crit") {
						_temp_damage += irandom_range(1, 6);	
					}
				}
				
				// Create the ranged attack object
				var _attack_dir = point_direction(attacker.x + NODE_CENTER_OFFSET, attacker.y + NODE_CENTER_OFFSET, target.x + NODE_CENTER_OFFSET, target.y + NODE_CENTER_OFFSET);
				var _begin_x = attacker.x + NODE_CENTER_OFFSET + lengthdir_x(30, _attack_dir);
				var _begin_y = attacker.y + NODE_CENTER_OFFSET + lengthdir_y(30, _attack_dir);
				var _end_x = target.x + NODE_CENTER_OFFSET;
				var _end_y = target.y + NODE_CENTER_OFFSET;
				
				with (instance_create_layer(_begin_x, _begin_y, "RangedWeapons", oArrow)) {
					target = other.target;
					status = _attack_status;
					damage = _temp_damage;
					// damage_type = ???
					
					path_add_point(movement_path, _begin_x, _begin_y, 100);
					path_add_point(movement_path, _end_x, _end_y, 100);
					
					path_start(movement_path, speed, true, true);
				}
				
				// Return control to cursor
				if (attacker.actions > 0) {
					oCursor.selected_actor = attacker.id;
					
					// Calculate movement nodes and color
					var _one_move_nodes = global.map.get_movement_nodes(global.map.grid[oGame.current_actor.grid_x][oGame.current_actor.grid_y], oGame.current_actor.pace);
					global.map.color_nodes(_one_move_nodes, c_yellow);
				} else {
					oGame.current_actor = noone;	
				}
				
				attacker.state_machine.swap(new StateActorIdle()); 
				break;
				
			case ATTACK_TYPE.MELEE:
				break;
		}
	}
}
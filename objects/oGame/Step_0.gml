/// @description Insert description here
switch(state) {
	case "initializing":
		with(oNode) {
			if (instance_position(x + NODE_CENTER_OFFSET, y + NODE_CENTER_OFFSET, oTerrain)) {
				var _temp_terrain = instance_position(x + NODE_CENTER_OFFSET, y + NODE_CENTER_OFFSET, oTerrain);
	
				switch(_temp_terrain.type) {
					case TERRAIN_TYPE.WALL:
						instance_change(oWall, true);
						type = TERRAIN_TYPE.WALL;
						passable = false;
						break;
		
					case TERRAIN_TYPE.RUBBLE:
						instance_change(oRubble, true);
						type = TERRAIN_TYPE.RUBBLE;
						movement_cost = 2;
						break;
				}
	
				with(_temp_terrain) {
					instance_destroy();	
				}
			}
			
			if( instance_position(x + NODE_CENTER_OFFSET, y + NODE_CENTER_OFFSET, oActor) ) {
				occupant = instance_position(x + NODE_CENTER_OFFSET, y + NODE_CENTER_OFFSET, oActor);
				occupant.grid_x = grid_x;
				occupant.grid_y = grid_y;
			}
		}
		state = "roll_initiative";
		break;
		
	case "roll_initiative":
		with (oActor) {
			initiative_card = other.initiative_deck.get_card();
			array_push(other.turn_order, id);
		}
		
		// Sort turn_order
		var _compare_initiative_cards_desc = function(_actor1, _actor2) {
			return initiative_deck.compare_cards_desc(_actor1.initiative_card, _actor2.initiative_card);
		}
		array_sort(turn_order, _compare_initiative_cards_desc);
		
		turn_max = array_length(turn_order);
		state = "ready";
		break;
		
	case "ready":
		if (current_actor == noone) {
			turn_counter += 1;
			
			if (turn_counter >= turn_max) {
				turn_counter = 0;
				round_counter += 1;
			}
			
			current_actor = turn_order[turn_counter];
			current_actor.actions = 2;
			current_actor.can_act = true;
			
			// Only pass off actions and cursor control if actor is BLUE_ARMY
			// otherwise set flash variable to true and set alarm
			if (current_actor.army == BLUE_ARMY) {
				oCursor.selected_actor = current_actor;
				
				// Calculate movement nodes and color
				var _one_move_nodes = global.map.get_movement_nodes(global.map.grid[current_actor.grid_x][current_actor.grid_y], current_actor.pace);
				var _full_move_nodes = global.map.get_movement_nodes(global.map.grid[current_actor.grid_x][current_actor.grid_y], current_actor.pace * current_actor.actions);
				global.map.color_nodes(_full_move_nodes, c_yellow);
				global.map.color_nodes(_one_move_nodes, c_aqua);
				
				// Calculate and color ranged attack nodes
				var _weapon = oCursor.selected_actor.equip_main_hand;
				if (_weapon && _weapon.is_ranged) {
					var _attack_nodes = global.map.get_attack_nodes_ranged(oCursor.selected_actor, _weapon.range_long);
					for (var _index=0; _index<array_length(_attack_nodes); _index++) {
						var _current_node = _attack_nodes[_index];
						_current_node.attack_node = true;
						_current_node.color = c_red;
					}
				}
			} else {
				current_actor.flash = true;
				current_actor.alarm[0] = 60;
			}
		}
		break;
}



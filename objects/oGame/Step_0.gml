/// @description Insert description here
switch(state) {
	case "initializing":
		with(oNode) {
			if (instance_position(x + NODE_CENTER_OFFSET, y + NODE_CENTER_OFFSET, oTerrain)) {
				var _temp_terrain = instance_position(x + NODE_CENTER_OFFSET, y + NODE_CENTER_OFFSET, oTerrain);
	
				switch(_temp_terrain.type) {
					case TERRAIN_TYPE.WALL:
						type = TERRAIN_TYPE.WALL;
						sprite_index = sWall;
						passable = false;
						break;
		
					case TERRAIN_TYPE.RUBBLE:
						type = TERRAIN_TYPE.RUBBLE;
						sprite_index = sRubble;
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
			oCursor.selected_actor = current_actor;
			
			// Calculate movement nodes
			var _one_move_nodes = global.map.get_movement_nodes(global.map.grid[current_actor.grid_x][current_actor.grid_y], current_actor.move);
			var _full_move_nodes = global.map.get_movement_nodes(global.map.grid[current_actor.grid_x][current_actor.grid_y], current_actor.move * current_actor.actions);
		
			// Color nodes
			global.map.color_nodes(_full_move_nodes, c_yellow);
			global.map.color_nodes(_one_move_nodes, c_aqua);
		}
		break;
}



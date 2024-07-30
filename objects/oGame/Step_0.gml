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
		temp_init = ds_priority_create();
		
		with (oActor) {
			var _init_roll = irandom_range(1, 20) + initiative;
			ds_priority_add(other.temp_init, id, _init_roll);
		}
		
		while (ds_priority_size(temp_init) > 0) {
			ds_list_add(turn_order, ds_priority_delete_max(temp_init));	
		}
		
		turn_max = ds_list_size(turn_order);
		
		ds_priority_destroy(temp_init);
		
		state = "ready";
		
		break;
		
	case "ready":
		if (current_actor == noone) {
			turn_counter += 1;
			
			if (turn_counter >= turn_max) {
				turn_counter = 0;
				round_counter += 1;
			}
			
			current_actor = ds_list_find_value(turn_order, turn_counter);
			
			current_actor.actions = 2;
			oCursor.selected_actor = current_actor;
			
			// Might want to move the next two blocks into a separate function
			// calculate movement nodes
			var _one_move_nodes = global.map.get_movement_nodes(global.map.grid[current_actor.grid_x][current_actor.grid_y], current_actor.move);
			var _full_move_nodes = global.map.get_movement_nodes(global.map.grid[current_actor.grid_x][current_actor.grid_y], current_actor.move * current_actor.actions);
		
			// color nodes
			global.map.color_nodes(_full_move_nodes, c_yellow);
			global.map.color_nodes(_one_move_nodes, c_aqua);
		}
		break;
}



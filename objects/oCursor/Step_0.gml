/// @description Insert description here
x = mouse_x;
y = mouse_y;

grid_x = floor(x/NODE_SIZE);
grid_y = floor(y/NODE_SIZE);

if (grid_x < 0 || grid_y < 0 || grid_x >= global.map.map_width || grid_y >= global.map.map_height) {
	hover_node = noone;
} else {
	hover_node = global.map.grid[grid_x, grid_y];	
}

// select actor if clicked
if (mouse_check_button_pressed(mb_left)) {
	if (hover_node.occupant != noone) {
		if (hover_node.occupant != selected_actor) {
			selected_actor = hover_node.occupant;
			selected_actor.actions = 2;
		
			// calculate movement nodes
			var _one_move_nodes = global.map.get_movement_nodes(global.map.grid[selected_actor.grid_x][selected_actor.grid_y], selected_actor.move);
			var _full_move_nodes = global.map.get_movement_nodes(global.map.grid[selected_actor.grid_x][selected_actor.grid_y], selected_actor.move * selected_actor.actions);
		
			// color nodes
			global.map.color_nodes(_full_move_nodes, c_yellow);
			global.map.color_nodes(_one_move_nodes, c_aqua);
		}
	} else {
		selected_actor = noone;
		global.map.wipe_nodes();
	}
}

// move selected actor on right click
if (mouse_check_button_pressed(mb_right)) {
	if(selected_actor != noone && hover_node.move_node) { // selected_actor != noone && hover_node.occupant == noone && hover_node.passable
		scr_actor_move_to_node(selected_actor, hover_node);
		
		// update selected actor and wipe nodes
		if (hover_node.g_score > selected_actor.move) {
			selected_actor.actions -= 2;
			global.map.wipe_nodes();
		} else {
			selected_actor.actions -= 1;
			global.map.wipe_nodes();
		}
		
		selected_actor = noone;
	} else {
		selected_actor = noone;
		global.map.wipe_nodes();
	}
}
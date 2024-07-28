/// @description Insert description here

// clear path
path_clear_points(movement_path);
state = "idle";

if (actions > 0) {
	oCursor.selected_actor = id;
	
	var _move_nodes = global.map.get_movement_nodes(global.map.grid[grid_x][grid_y], move);
	global.map.color_nodes(_move_nodes, c_yellow);
}

/// @description Insert description here

state_machine.swap(new StateActorIdle()); 

if (actions > 0) {
	oCursor.selected_actor = id;
	
	var _move_nodes = global.map.get_movement_nodes(global.map.grid[grid_x][grid_y], pace);
	global.map.color_nodes(_move_nodes, c_yellow);
} else {
	oGame.current_actor = noone;	
}

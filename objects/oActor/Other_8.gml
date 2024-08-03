/// @description Insert description here

state_machine.swap(new StateActorIdle()); 

if (actions > 0) {
	oCursor.selected_actor = id;
	
	var _move_nodes = global.map.get_movement_nodes(global.map.grid[grid_x][grid_y], pace);
	global.map.color_nodes(_move_nodes, c_yellow);
	
	if (can_act) {
		var _weapon = oCursor.selected_actor.equip_main_hand;
		if (_weapon && _weapon.is_ranged) {
			// Currently this is handling the coloring and setting attack_node, and returns nothing
			global.map.get_attack_nodes_ranged(id, _weapon.range_long);
		}
	}
} else {
	oGame.current_actor = noone;	
}

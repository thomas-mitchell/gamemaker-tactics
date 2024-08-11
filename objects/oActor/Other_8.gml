/// @description Insert description here

state_machine.swap(new StateActorIdle()); 

if (actions > 0) {
	oCursor.selected_actor = id;
	
	var _move_nodes = global.map.get_movement_nodes(global.map.grid[grid_x][grid_y], pace);
	global.map.color_nodes(_move_nodes, c_yellow);
	
	if (can_act) {
		var _weapon = oCursor.selected_actor.equip_main_hand;
		
		// Calculate and color ranged attack nodes
		if (_weapon && _weapon.is_ranged) {
			var _attack_nodes = global.map.get_attack_nodes_ranged(id, _weapon.range_long);
			for (var _index=0; _index<array_length(_attack_nodes); _index++) {
				var _current_node = _attack_nodes[_index];
				_current_node.attack_node = true;
				_current_node.color = c_red;
			}
		}
		
		// Calculate and color melee attack nodes
		var _attack_nodes = global.map.get_attack_nodes_melee(oCursor.selected_actor);
		for (var _index=0; _index<array_length(_attack_nodes); _index++) {
			var _current_node = _attack_nodes[_index];
			_current_node.attack_node = true;
			_current_node.color = c_red;
		}
	}
} else {
	oGame.current_actor = noone;	
}

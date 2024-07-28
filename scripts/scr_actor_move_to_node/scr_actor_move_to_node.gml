// Script assets have changed for v2.3.0 see
function scr_actor_move_to_node(_actor, _node) {
	// create path
	var _start_node = global.map.grid[_actor.grid_x, _actor.grid_y];
	var _nodes_path = global.map.get_path(_start_node, _node);
	
	for (var _index=0; _index<array_length(_nodes_path); _index++) {
		var _speed = 100;
		path_add_point(selected_actor.movement_path, _nodes_path[_index].x, _nodes_path[_index].y, _speed);
	}
	
	// create and apply new state to actor
	var _follow_state = new StateActorFollowPath(_actor);
	_actor.state_machine.swap( _follow_state);
	
	// update grid and actor
	global.map.grid[selected_actor.grid_x][selected_actor.grid_y].occupant = noone;
		
	_actor.grid_x = grid_x;
	_actor.grid_y = grid_y;
	_actor.x = _node.x;
	_actor.y = _node.y;
		
	_node.occupant = _actor;
}
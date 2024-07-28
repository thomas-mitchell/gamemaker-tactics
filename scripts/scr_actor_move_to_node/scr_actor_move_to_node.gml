// Script assets have changed for v2.3.0 see
function scr_actor_move_to_node(_actor, _node) {
	var _start_node = global.map.grid[_actor.grid_x, _actor.grid_y];
	var _nodes_path = global.map.get_path(_start_node, _node);
	
	for (var _index=0; _index<array_length(_nodes_path); _index++) {
		var _speed = 100;
		path_add_point(selected_actor.movement_path, _nodes_path[_index].x, _nodes_path[_index].y, _speed);
	}
	with (_actor) {
		path_start(movement_path, move_speed, 0, true);
	}
		
	global.map.grid[selected_actor.grid_x][selected_actor.grid_y].occupant = noone;
		
	_actor.grid_x = grid_x;
	_actor.grid_y = grid_y;
	_actor.x = hover_node.x;
	_actor.y = hover_node.y;
		
	oCursor.hover_node.occupant = _actor;
}
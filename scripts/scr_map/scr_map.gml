// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Map(_map_width, _map_height) constructor {
	map_width = _map_width;
	map_height = _map_height;
	
	// create nodes
	for(xx=0; xx<map_width; xx+=1) {
		for(yy=0; yy<map_height; yy+=1) {
			grid[xx, yy] = instance_create_layer(xx * NODE_SIZE, yy * NODE_SIZE, "Grid", oNode);
			grid[xx, yy].grid_x = xx;
			grid[xx, yy].grid_y = yy;
		}
	}

	// populate neighbours
	for(xx=0; xx<map_width; xx+=1) {
		for(yy=0; yy<map_height; yy+=1) {
			var _node = grid[xx, yy];
		
			// add left neighbour
			if (xx > 0) {
				array_push(_node.neighbours, grid[xx-1, yy]);
			}
		
			// add right neighbour
			if (xx < map_width-1) {
				array_push(_node.neighbours, grid[xx+1, yy]);
			}
		
			// add top neighbour
			if (yy > 0) {
				array_push(_node.neighbours, grid[xx, yy-1]);
			}
		
			// add bottom neighbour
			if (yy < map_height-1) {
				array_push(_node.neighbours, grid[xx, yy+1]);
			}
		
			// add top left neighbour
			if (xx>0 && yy>0) {
				array_push(_node.neighbours, grid[xx-1, yy-1]);
			}
		
			// add top right neighbour
			if (xx < map_width-1 && yy>0) {
				array_push(_node.neighbours, grid[xx+1, yy-1]);
			}
		
			// add bottom left neighbour
			if (xx>0 && yy<map_height-1) {
				array_push(_node.neighbours, grid[xx-1, yy+1]);
			}
		
			// add bottom right neighbour
			if (xx<map_width-1 && yy<map_height-1) {
				array_push(_node.neighbours, grid[xx+1, yy+1]);
			}
		}
	}
	
	wipe_nodes = function() {
		with(oNode) {
			move_node = false;
			g_score = 0;
			parent = noone;
			color = c_white;
		}
	}
	
	color_nodes = function(_node_list, _color) {
		for (index=0; index<array_length(_node_list); index++) {
			var _node = _node_list[index];
			_node.color = _color;
		}
	}
	
	get_movement_nodes = function(_start_node, _range)  {
		wipe_nodes();
		
		// create data structures
		var _open_nodes = ds_priority_create();
		var _closed_nodes = [];
		
		// add starting node to open list
		ds_priority_add(_open_nodes, _start_node, _start_node.g_score);
		
		while(ds_priority_size(_open_nodes) > 0) {
			// grab node with lowest g score
			var _current_node = ds_priority_delete_min(_open_nodes);
			
			array_push(_closed_nodes, _current_node);
			
			// step through neighbours
			for (ii=0; ii < array_length(_current_node.neighbours); ii++) {
				var _neighbour = _current_node.neighbours[ii];
				
				// add neighbour to open list if it qualifies
				if(!array_contains(_closed_nodes, _neighbour) && _neighbour.passable && _neighbour.occupant == noone && _neighbour.movement_cost + _current_node.g_score <= _range) {
					// calculate cost mod
					var _cost_mod = 1;
					if (_neighbour.grid_x != _current_node.grid_x && _neighbour.grid_y != _current_node.grid_y) {
						_cost_mod = 1.5;
					}
					
					// calculate g score for neighbour if it doesn't already have one
					if(ds_priority_find_priority(_open_nodes, _neighbour) == 0 || ds_priority_find_priority(_open_nodes, _neighbour) == undefined) {
						_neighbour.parent = _current_node;
						_neighbour.g_score = _current_node.g_score + (_neighbour.movement_cost * _cost_mod);
						
						// add node to open list
						ds_priority_add(_open_nodes, _neighbour, _neighbour.g_score);
					} else {
						// neighbour already has g score
						var _temp_g = _current_node.g_score + (_neighbour.movement_cost * _cost_mod);
						
						if (_temp_g < _neighbour.g_score) {
							_neighbour.parent = _current_node;
							_neighbour.g_score = _temp_g;
							ds_priority_change_priority(_open_nodes, _neighbour, _neighbour.g_score);
						}
					}
				}
			}
		}
		
		// round down g scores
		with(oNode) {
			g_score = floor(g_score);	
		}
		
		ds_priority_destroy(_open_nodes);
		
		// mark all closed nodes except the start node as potential movement positions
		for(var index=9; index<array_length(_closed_nodes); index++) {
			_closed_nodes[index].move_node = true;	
		}
		_start_node.move_node = false;
		
		return _closed_nodes;
	}

	get_path = function(_start_node, _end_node) {
		var _path = [];
		var _current = _end_node;
		
		array_push(_path, _current);
		while (_current.parent != noone) {
			array_push(_path, _current.parent);
			_current = _current.parent;
		}
		
		return array_reverse(_path);	
	}
}
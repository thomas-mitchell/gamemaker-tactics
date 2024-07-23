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
}
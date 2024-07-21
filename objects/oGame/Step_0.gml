/// @description Insert description here
switch(state) {
	case "initializing":
		with(oNode) {
			if (instance_position(x + NODE_CENTER_OFFSET, y + NODE_CENTER_OFFSET, oTerrain)) {
				var _temp_terrain = instance_position(x + NODE_CENTER_OFFSET, y + NODE_CENTER_OFFSET, oTerrain);
	
				switch(_temp_terrain.type) {
					case "wall":
						type = "wall";
						sprite_index = sWall;
						passable = false;
						break;
		
					case "rubble":
						type = "rubble";
						sprite_index = sRubble;
						cost = 2;
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
		state = "ready";
		break;
}



// Script assets have changed for v2.3.0 see
enum TERRAIN_TYPE {
	NODE,
	WALL,
	RUBBLE
}

function get_terrain_type_name(_terrain_type) {
	switch (_terrain_type) {
		case TERRAIN_TYPE.NODE:
			return "node";
			
		case TERRAIN_TYPE.WALL:
			return "wall";

		case TERRAIN_TYPE.RUBBLE:
			return "rubble";
	}
	
	return "error";
}
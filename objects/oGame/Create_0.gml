/// @description Insert description here
#macro NODE_SIZE 32		// Renamed from GRID_SIZE

// Create the map
var _map_width = room_width / NODE_SIZE;
var _map_height = room_height / NODE_SIZE;
global.map = new Map(_map_width, _map_height);

// Create the cursor
window_set_cursor(cr_none);
instance_create_layer(x, y, "Cursor", oCursor);

// Create a couple of example actors
with(instance_create_layer(5*NODE_SIZE, 5*NODE_SIZE, "Actors", oHero)) {
	grid_x = 5;
	grid_y = 5;
	name = "Sandy";
	global.map.grid[grid_x, grid_y].occupant = id;
}

with(instance_create_layer(5*NODE_SIZE, 8*NODE_SIZE, "Actors", oHero)) {
	grid_x = 5;
	grid_y = 8;
	name = "Danny";
	global.map.grid[grid_x, grid_y].occupant = id;
}

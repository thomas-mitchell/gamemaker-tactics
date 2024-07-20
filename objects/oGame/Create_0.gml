/// @description Insert description here
#macro NODE_SIZE 32		// Renamed from GRID_SIZE

// Create the map
var _map_width = room_width / NODE_SIZE;
var _map_height = room_height / NODE_SIZE;
global.map = new Map(_map_width, _map_height);

// Create the cursor
window_set_cursor(cr_none);
instance_create_layer(x, y, "Cursor", oCursor);

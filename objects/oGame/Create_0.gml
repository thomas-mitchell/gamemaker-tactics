/// @description Insert description here
#macro NODE_SIZE 32		// Renamed from GRID_SIZE
#macro NODE_CENTER_OFFSET 16

state = "initializing";

randomize();
//random_set_seed(123456);

// Turn tracking variables
turn_order = [];
turn_counter = -1;
turn_max = 0;	// Not sure about this, might be more intuitive to just use array_size(turn_order)
current_actor = noone;
round_counter = 1;
initiative_deck = new CardDeck(); 

// Create the map
var _map_width = room_width / NODE_SIZE;
var _map_height = room_height / NODE_SIZE;
global.map = new Map(_map_width, _map_height);

// Create the cursor
window_set_cursor(cr_none);
instance_create_layer(x, y, "Cursor", oCursor);


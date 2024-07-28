/// @description Insert description here
grid_x = 0;
grid_y = 0;

name = "Error";

// character statistics
move = 5;
actions = 2;

state = "idle";

// pathfinding variables
movement_path = path_add();
path_set_kind(movement_path, 2);
path_set_closed(movement_path, false);

move_speed = 8;

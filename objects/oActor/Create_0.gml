/// @description Insert description here
grid_x = 0;
grid_y = 0;

name = "Error";

// character statistics
move = 5;
actions = 2;

// Probably going to delete these for card based initiative instead
//initiative = 0;
//init_roll = 0;
initiative_card = noone;

//state = "idle";
state_machine = new StateMachine();
var _initial_state = new StateActorIdle();
state_machine.swap(_initial_state);

// pathfinding variables
movement_path = path_add();
path_set_kind(movement_path, 2);
path_set_closed(movement_path, false);

move_speed = 8;

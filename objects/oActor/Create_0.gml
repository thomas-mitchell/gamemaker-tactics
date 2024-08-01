/// @description Insert description here
grid_x = 0;
grid_y = 0;

army = BLUE_ARMY;

// Character statistics /////////////////////////////
name = "Error";
race = "Human";
wildcard = false;
wounds = 0;
max_wounds = 0;
shaken = false;
// Attributes
attribute_agility_die = 4;
attribute_smarts_die = 4;
attribute_spirit_die = 4;
attribute_strength_die = 4;
attribute_vigor_die = 4;
// Skills
skill_fighting_die = 0;
skill_shooting_die = 0;


// movement variables
pace = 5;
actions = 2;

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

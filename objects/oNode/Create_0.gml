neighbours = [];

color = c_white;

occupant = noone;
passable = true;

grid_x = 0;
grid_y = 0;

type = TERRAIN_TYPE.NODE;

// pathfinding variables
parent = noone;
g_score = 0;
move_node = false;
movement_cost = 1;

/// @description Insert description here
x = mouse_x;
y = mouse_y;

grid_x = floor(x/NODE_SIZE);
grid_y = floor(y/NODE_SIZE);

if (grid_x < 0 || grid_y < 0 || grid_x >= global.map.map_width || grid_y >= global.map.map_height) {
	hover_node = noone;
} else {
	hover_node = global.map.grid[grid_x, grid_y];	
}
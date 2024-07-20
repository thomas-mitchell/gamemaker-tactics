/// @description Insert description here

// draw selected node
if (hover_node != noone) {
	draw_sprite(sSelected, -1, grid_x * NODE_SIZE, grid_y * NODE_SIZE);	
}

draw_self();

// draw hover_node indexes
if (hover_node != noone) {
	var _text = string(grid_x) + " / " + string(grid_y);
	
	draw_set_color(c_black);
	draw_rectangle(0, 0, string_width(_text), string_height(_text), false);
	draw_set_color(c_white);
	draw_text(0, 0, _text);
}

/// @description Insert description here

// if cursor is above another node and this is the selected actor draw a line to hover node
if(oCursor.hover_node != noone && oCursor.hover_node != global.map.grid[grid_x, grid_y] && oCursor.selected_actor == id) {
	var _current = oCursor.hover_node;
	var _line_width = 4;
	
	// step through every node in chain until we reach actors node
	while(_current.parent != noone) {
		draw_line_width_color(_current.x + NODE_CENTER_OFFSET, _current.y + NODE_CENTER_OFFSET, _current.parent.x + NODE_CENTER_OFFSET, _current.parent.y + NODE_CENTER_OFFSET, _line_width, c_lime, c_lime);
		_current = _current.parent;
	}
}

draw_self();
//var _color = shaken ? c_red : c_white;
//draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 0, _color, 1);

// Draw shaken indicator
if (shaken) {
	var _text = "S";
	draw_set_color(c_black);
	draw_text(x + 2, y, _text);
}

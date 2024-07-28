/// @description Insert description here

// if cursor is above another node draw a line
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

/// @description Insert description here

// if cursor is above another node and this is the selected actor draw a line to hover node
if (oCursor.selected_actor == id) {
	if (oCursor.hover_node != noone) {
		var _temp_node = oCursor.hover_node;
		
		if (_temp_node.move_node) {
			var _current = _temp_node;
			var _line_width = 4;
	
			// step through every node in chain until we reach actors node
			while(_current.parent != noone) {
				draw_line_width_color(_current.x + NODE_CENTER_OFFSET, _current.y + NODE_CENTER_OFFSET, _current.parent.x + NODE_CENTER_OFFSET, _current.parent.y + NODE_CENTER_OFFSET, _line_width, c_lime, c_lime);
				_current = _current.parent;
			}
		}
		
		if (_temp_node.attack_node) {
			var _weapon = oCursor.selected_actor.equip_main_hand;
			if (_weapon && _weapon.is_ranged) {
				var _line_width = 4;
				var _start_x = x + NODE_CENTER_OFFSET;
				var _start_y = y + NODE_CENTER_OFFSET;
				var _end_x = _temp_node.x + NODE_CENTER_OFFSET;
				var _end_y = _temp_node.y + NODE_CENTER_OFFSET;
				draw_line_width_color(_start_x, _start_y, _end_x, _end_y, _line_width, c_purple, c_purple);
			}
		}
	}
	
	//if(oCursor.hover_node != noone && oCursor.hover_node != global.map.grid[grid_x, grid_y] ) {
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

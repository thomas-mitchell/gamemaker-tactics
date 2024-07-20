/// @description Insert description here

// draw selected node
if (hover_node != noone) {
	draw_sprite(sSelected, -1, grid_x * NODE_SIZE, grid_y * NODE_SIZE);	
}

draw_self();

// draw hover_node index and occupant
if (hover_node != noone) {
	var _text = string(grid_x) + " / " + string(grid_y) + " = ";
	
	if (hover_node.occupant != noone) {
		_text += hover_node.occupant.name;	
	} else {
		_text += "noone";	
	}
	
	draw_set_color(c_black);
	draw_rectangle(0, 0, string_width(_text), string_height(_text), false);
	draw_set_color(c_white);
	draw_text(0, 0, _text);
}

// draw selected actor name
if (selected_actor != noone) {
	var _text = selected_actor.name;
	
	draw_set_color(c_black);
	draw_rectangle(0, room_height, string_width(_text), room_height - string_height(_text), false);
	
	draw_set_color(c_white);
	draw_text(0, room_height - string_height(_text), _text);
}
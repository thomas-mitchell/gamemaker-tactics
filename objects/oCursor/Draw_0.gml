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
	
	_text = get_terrain_type_name(hover_node.type);
	if (hover_node.passable) {
		_text += " passable = true" + " movement_cost = " + string(hover_node.movement_cost);
	}
	
	draw_set_color(c_black);
	draw_rectangle(0, 20, string_width(_text), string_height(_text) + 20, false);
	draw_set_color(c_white);
	draw_text(0, 20, _text);
}


if (selected_actor != noone) {
	// Draw selected actor name
	var _text = selected_actor.name;
	
	// Draw initiative card name instead
	//if (selected_actor.initiative_card != noone) {
	//	_text = selected_actor.initiative_card.name;
	//}
	
	draw_set_color(c_black);
	draw_rectangle(0, room_height, string_width(_text), room_height - string_height(_text), false);
	
	draw_set_color(c_white);
	draw_text(0, room_height - string_height(_text), _text);
}
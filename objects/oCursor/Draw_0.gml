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
	
	draw_text_block(0, 0, _text, c_white, c_black);
	
	_text = get_terrain_type_name(hover_node.type);
	if (hover_node.passable) {
		_text += " passable = true" + " movement_cost = " + string(hover_node.movement_cost);
	}
	
	draw_text_block(0, 20, _text, c_white, c_black);
}


if (selected_actor != noone) {
	// Draw selected actor name and status
	var _text = selected_actor.name;
	if (selected_actor.shaken) {
		_text += " (shaken)";	
	}
	if (selected_actor.wounds > 0) {
		var _wounds_text = string(selected_actor.wounds) + " wound";
		if (selected_actor.wounds > 1) {
			_wounds_text += "s";	
		}
		_text += " (" +_wounds_text + ")";	
	}
	
	// Draw initiative card name instead
	//if (selected_actor.initiative_card != noone) {
	//	_text = selected_actor.initiative_card.name;
	//}
	
	// Draw text block in bottom left corner
	var _text_y = room_height - string_height(_text);
	draw_text_block(0, _text_y, _text, c_white, c_black);
}

// DEBUG Draw oGame current actor
if(true) {
	var _text = "Current actor: ";
	if (oGame.current_actor == noone) {
		_text += "noone";	
	} else {
		_text += oGame.current_actor.name;	
	}
	var _text_x = room_width - string_width(_text);
	draw_text_block(_text_x, 0, _text, c_white, c_black);
}
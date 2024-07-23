/// @description Insert description here
/// @description Insert description here
draw_self();

// draw number of neighbours
draw_set_colour(c_black);
draw_text(x+4, y+1, string(array_length(neighbours)));

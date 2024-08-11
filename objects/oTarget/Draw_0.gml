/// @description Insert description here
if (flash) {
	color = choose(c_white, c_yellow, c_orange);	
}

if (shake > 0) {
	draw_sprite_ext(sprite_index, -1, x + irandom_range(-shake_mag, shake_mag), y + irandom_range(-shake_mag, shake_mag), 1, 1, 0, color, 1);
} else {
	draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 0, color, 1);
}

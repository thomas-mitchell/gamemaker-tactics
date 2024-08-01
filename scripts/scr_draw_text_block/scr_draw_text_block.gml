function draw_text_block(_x, _y, _text, _text_color, _background_color) {
	var _width = string_width(_text);
	var _height = string_height(_text);
	
	draw_set_color(_background_color);
	draw_rectangle(_x, _y, _x + _width, _y + _height , false);
	
	draw_set_color(_text_color);
	draw_text(_x, _y, _text);
}
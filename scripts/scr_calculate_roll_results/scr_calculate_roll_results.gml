function scr_calculate_roll_results(_target_number, _roll) {
	if (_roll < _target_number) {
		return -1;	
	}
	
	return floor((_roll - _target_number) / 4);
}
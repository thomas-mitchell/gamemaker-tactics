// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_resolve_attack(_target, _attack_status, _damage){
	if (_attack_status != "miss") {
		//target.hit_points -= damage;
	
		// Create biff effect
		for (var _ii = 0; _ii<6; _ii++) {
			with (instance_create_layer(_target.x + NODE_CENTER_OFFSET, _target.y + NODE_CENTER_OFFSET, "Text", oBiff)) {
				direction = irandom(360);
				speed = irandom_range(2, 4);
				scale = choose(2, 3);
				image_speed = 0.25;
			
				if (_attack_status == "crit") {
					color = c_yellow;	
				}
			}
		}
	
		// Create damage text
		with (instance_create_layer(_target.x + NODE_SIZE - 4, _target.y + 2, "Text", oDamageText)) {
			text = "-" + string(_damage);
			ground = y;
			if (_attack_status == "crit") {
				font = fnt_crit;
			}
		}
	
		// Apply shake to target
		if (_attack_status == "crit") {
			_target.shake = 8;
			_target.shake_mag = 8;
		} else {
			_target.shake = 4;
			_target.shake_mag = 4;
		}
	} else { // Was a miss
		// Create miss text
		with (instance_create_layer(_target.x + NODE_SIZE - 4, _target.y + 2, "Text", oDamageText)) {
			text = "miss";
			ground = y;
		}
	}
}
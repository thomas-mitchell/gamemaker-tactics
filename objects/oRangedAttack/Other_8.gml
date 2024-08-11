/// @description Insert description here
if (status != "miss") {
	//target.hit_points -= damage;
	
	for (var _ii = 0; _ii<6; _ii++) {
		with (instance_create_layer(target.x + NODE_CENTER_OFFSET, target.y + NODE_CENTER_OFFSET, "Text", oBiff)) {
			direction = irandom(360);
			speed = irandom_range(2, 4);
			scale = choose(2, 3);
			image_speed = 0.25;
			
			if (other.status == "crit") {
				color = c_yellow;	
			}
		}
	}
	
	with (instance_create_layer(target.x + NODE_SIZE - 4, target.y + 2, "Text", oDamageText)) {
		text = "-" + string(other.damage);
		ground = y;
		if (other.status == "crit") {
			font = fnt_crit;
		}
	}
	
	if (status == "crit") {
		target.shake = 8;
		target.shake_mag = 8;
	} else {
		target.shake = 4;
		target.shake_mag = 4;
	}
} else {
	// Was a miss
	with (instance_create_layer(target.x + NODE_SIZE - 4, target.y + 2, "Text", oDamageText)) {
		text = "miss";
		ground = y;
	}
}

instance_destroy();

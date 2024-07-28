/// @description Insert description here
switch (state) {
	case "begin_path":
		path_start(movement_path, move_speed, 0, true);
		state = "moving";
		break;
	//case "idle":
	//	break;
}

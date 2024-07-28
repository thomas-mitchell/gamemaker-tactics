// Script assets have changed for v2.3.0 see
function StateActorFollowPath(_actor): State() constructor {
	actor = _actor;
	
	create = function() {
		with (actor) {
			path_start(movement_path, move_speed, 0, true);
		}
	}
	
	destroy = function() {
		with (actor) {
			path_clear_points(movement_path);	
		}
	}
}
var _input_x = keyboard_check(ord("D")) - keyboard_check(ord("A")),
	_input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

aim_dir = point_direction(x, y, mouse_x, mouse_y);

// Speed reduced for backpedal movement.
// Difference in aim_dir and move_dir greater than 90 scales the lerp position from 0 to 1
move_speed_mod -= lerp(0, 0.3, max(0, (abs(angle_difference(aim_dir, move_dir)) - 90)) / 90);

add_movement_input(_input_x, _input_y);

event_inherited();
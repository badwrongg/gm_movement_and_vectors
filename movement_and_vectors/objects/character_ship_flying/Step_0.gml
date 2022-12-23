thrust = mouse_check_button(mb_left);
boost  = keyboard_check(vk_shift);

// Speed booster
move_speed_mod += boost_speed * boost;

// Steer with left mouse button
if (thrust)
	add_movement_input(mouse_x - x, mouse_y - y);
	
// Turn facing direction towards movement direction
facing_dir = lerp(facing_dir, facing_dir + angle_difference(move_dir, facing_dir), turn_speed);

event_inherited();
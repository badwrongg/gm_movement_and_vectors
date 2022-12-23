thrust_dir[0] = keyboard_check(ord("D"));
thrust_dir[1] = keyboard_check(ord("W"));
thrust_dir[2] = keyboard_check(ord("A"));
thrust_dir[3] = keyboard_check(ord("S"));

for (var _t = 0; _t < 4; _t++)
	if (thrust_dir[_t])
		add_impulse_direction(thrust_angle[_t], thrust_power);
		
event_inherited();
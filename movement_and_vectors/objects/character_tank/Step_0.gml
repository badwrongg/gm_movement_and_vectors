mouse_dir = point_direction(x, y, mouse_x, mouse_y);

var _turn_dir = angle_difference(aim_dir, mouse_dir),
	_turn     = keyboard_check(ord("A")) - keyboard_check(ord("D")),
	_accel    = keyboard_check(ord("W")) - keyboard_check(ord("S")),
	_fire     = mouse_check_button_pressed(mb_left);

aim_dir   -= min(abs(_turn_dir), aim_turn_speed) * sign(_turn_dir);
aim_cos    = dcos(aim_dir);
aim_sin    = -dsin(aim_dir);
aim_x      = x + gun_length * aim_cos;
aim_y      = y + gun_length * aim_sin;
facing_dir = (facing_dir + _turn * facing_turn_speed + 360) mod 360;

// Move forward or back
if (_accel != 0)
	add_movement_direction(facing_dir + 180 * sign(_accel - 1));

// Fire tank cannon
if (_fire)
{
	instance_create_layer(aim_x, aim_y, layer, projectile_tank_bullet,
		{
			owner  : id,
			team   : team,
			hspeed : aim_cos,
			vspeed : aim_sin,
			image_angle : aim_dir
		});
}

event_inherited();
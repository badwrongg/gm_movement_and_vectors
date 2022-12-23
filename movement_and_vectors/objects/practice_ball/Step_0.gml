if (on_horizontal != 0)
{
	impulse_force_x *= -1;
	on_horizontal = 0;
}

if (on_vertical > 0)
{
	impulse_force_y *= -1;
	
	var _bounce = grav_power * 0.5;
	if (_bounce > 5)
		add_impulse_direction(90, _bounce);
		
	grav_power = 0;
	on_vertical = 0;
}
else
{
	if (on_vertical < 0)
	{
		impulse_force_y *= -1;
		on_vertical = 0;	
	}
	
	grav_power += grav_rate;
	add_constant_force(270, grav_power);
}
	
event_inherited();
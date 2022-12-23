if (instance_exists(owner))
{
	// Keeps the melee attack with the owner and accounts for their rotation/scale
	var _angle = owner.aim_dir,
		_t     = image_angle + angle_difference(_angle, image_angle),
		_cos   = dcos(_t),
		_sin   = -dsin(_t);

	x = owner.x + (x_off * _cos - y_off * _sin) * owner.image_xscale;
	y = owner.y + (x_off * _sin + y_off * _cos) * owner.image_yscale;
	image_angle = _angle;
	
	// Find what was hit
	var _hits  = ds_list_create(),
		_count = instance_place_list(x, y, __hurtbox, _hits, false),
		_hit = 0;

	// Apply damage to what was hit and tag it
	for (var _i = 0, _id; _i < _count; _i++)
	{
		_id = _hits[| _i]; 
		
		if (_id.team == team || ds_list_find_index(tag_list, _id) != -1)
			continue;

		ds_list_add(tag_list, _id);
		_id.receive_impulse_direction(90, knockup_power);
		_hit += _id.receive_damage(damage, team);
	}

	ds_list_destroy(_hits);
}
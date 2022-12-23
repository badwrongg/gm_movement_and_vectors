function create_hurtbox(_owner, _team, _hitpoints, _width, _height)
{
	return instance_create_depth(x, y, 0, __hurtbox,
			{
				owner          : _owner,
				team           : _team,
				hitpoints      : _hitpoints,
				image_xscale   : _width * 0.5,
				image_yscale   : _height * 0.5,
			});
}

function invulnerable_receive_damage(_dmg, _team)
{
	if (_team == team)
		return 0;
	
	return 1;	
}

function self_receive_damage(_dmg, _team)
{
	if (invincible || _team == team)
		return 0;
		
	hitpoints -= _dmg;
	if (hitpoints <= 0)
		instance_destroy(id);
	
	return _dmg;
}

function hurtbox_receive_damage(_dmg, _team)
{
	if (invincible || _team == team)
		return 0;
	
	with (owner)
	{
		hitpoints -= _dmg;
		if (hitpoints <= 0)
			instance_destroy(id);
		
		return _dmg;
	}

	return 0;
}

function self_receive_impulse_position(_x, _y, _power)
{
	add_impulse_position(_x, _y, _power);
	return true;
}

function hurtbox_receive_impulse_position(_x, _y, _power)
{
	owner.add_impulse_position(_x, _y, _power);
	return true;
}

function self_receive_impulse_direction(_dir, _power)
{
	add_impulse_direction(_dir, _power);
	return true;
}

function hurtbox_receive_impulse_direction(_dir, _power)
{
	owner.add_impulse_direction(_dir, _power);
	return true;
}

function immune_receive_impulse(_x, _y, _power)
{
	return false	
}
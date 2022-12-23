#macro C_TERMINAL_VELOCITY 25
#macro C_MAXIMUM_IMPULSE_FORCE 1000
#macro C_GRAVITY 17

function character_add_movement_input(_input_x, _input_y)
{
	// Apply acceleration
	if (_input_x != 0 || _input_y != 0)
	{		
		// Normalize input
		var _dist = sqrt(_input_x * _input_x + _input_y * _input_y);
		_input_x /= _dist; // cosine
		_input_y /= _dist; // sine
	
		// Add acceleration to current movement
		var _move_accel = (move_accel + move_decel) * move_friction;
		move_x += _input_x * _move_accel;
		move_y += _input_y * _move_accel;
	
		// Limit max movement speed
		_dist = sqrt(move_x * move_x + move_y * move_y);
		move_speed = min(move_speed_max * max(0, move_speed_mod), _dist);
		if (_dist != 0)
		{
			// Set new normal vector
			move_norm_x = move_x / _dist; // cosine
			move_norm_y = move_y / _dist; // sine
		}
	
		// Set the movement direction
		move_dir = darctan2(-move_norm_y, move_norm_x);
	}
}

function character_add_movement_direction(_direction)
{
	_direction = (_direction + 360) mod 360;
	
	var _cos = dcos(_direction),
		_sin = -dsin(_direction),
		_move_accel = (move_accel + move_decel) * move_friction;
	
	// Add acceleration to current movement
	move_x += _cos * _move_accel;
	move_y += _sin * _move_accel;
	move_norm_x = _cos;
	move_norm_y = _sin;
	move_dir = _direction;
	move_speed = min(move_speed_max * max(0, move_speed_mod), move_speed + _move_accel);
}

function character_add_impulse_direction(_dir, _power)
{
	_power *= impulse_mod;
	
	var _vx   = impulse_force_x + dcos(_dir) * _power,
		_vy   = impulse_force_y - dsin(_dir) * _power,
		_dist = sqrt(_vx * _vx + _vy * _vy);
		
	// Limit to maximum impulse force
	if (_dist > C_MAXIMUM_IMPULSE_FORCE)
	{
		// Normalize and apply magnitude
		impulse_force_x = _vx / _dist * C_MAXIMUM_IMPULSE_FORCE; // cosine * magnitude
		impulse_force_y = _vy / _dist * C_MAXIMUM_IMPULSE_FORCE; // sine   * magnitude
	}
	else
	{
		impulse_force_x = _vx;
		impulse_force_y = _vy;
	}
}

function character_add_impulse_position(_x, _y, _power)
{
	_power *= impulse_mod;
	
	var _vx = x - _x,
		_vy = y - _y,
		_dist = _vx * _vx + _vy * _vy;
	
	if (_dist != 0)
	{
		// Normalize, apply magnitude, and add to current impulse vector
		_dist = sqrt(_dist);
		_vx = impulse_force_x + _vx / _dist * _power; // cosine * magnitude
		_vy = impulse_force_y + _vy / _dist * _power; // sine   * magnitude
		
		// Limit to maximum impulse force
		_dist = sqrt(_vx * _vx + _vy * _vy);
		if (_dist > C_MAXIMUM_IMPULSE_FORCE)
		{
			// Normalize and apply magnitude
			impulse_force_x = _vx / _dist * C_MAXIMUM_IMPULSE_FORCE; // cosine * magnitude
			impulse_force_y = _vy / _dist * C_MAXIMUM_IMPULSE_FORCE; // sine   * magnitude
		}
		else
		{
			impulse_force_x = _vx;
			impulse_force_y = _vy;
		}
	}
}

function character_add_constant_force(_direction, _power)
{
	constant_force_x += dcos(_direction) * _power;
	constant_force_y -= dsin(_direction) * _power;
}
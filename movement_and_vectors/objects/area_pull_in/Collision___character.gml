var _vx = x - other.x,
	_vy = y - other.y,
	_dist = sqrt(_vx * _vx + _vy * _vy),
	_radius = sprite_width * 0.5;

if (_dist > 0 && _dist < _radius)
{	
	var _direction = darctan2(-_vy, _vx),
		_pos = _dist / _radius;  
		_power = min(_dist, lerp(0, max_pull_power, 1.0 - (_pos * _pos * _pos) ));
	other.add_constant_force(_direction, _power);
}
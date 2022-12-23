// Update movement vector
move_x = move_norm_x * move_speed;
move_y = move_norm_y * move_speed;

// Add up total movement velocity
var _vx = move_x + impulse_force_x + constant_force_x,
	_vy = move_y + impulse_force_y + constant_force_y;

// Normalize and set magnitude
var _dist = sqrt(_vx * _vx + _vy * _vy);
velocity = min(C_TERMINAL_VELOCITY, _dist);
if (_dist != 0)
{
	_vx = _vx / _dist * velocity;
	_vy = _vy / _dist * velocity;
}

velocity_x = _vx;
velocity_y = _vy;

// **** Movement and collisions (inherited from __entity) ****
move_collide_state(_vx, _vy);


// **** Post-movement friction, resets, etc. ****
// Decel and reset modifier
move_speed = max(move_speed - move_decel * move_friction, 0); 
move_speed_mod = 1;

// Apply friction to impulse vector
impulse_mod = 1;
if (abs(impulse_force_x) + abs(impulse_force_y) > 1)
{
	impulse_force_x *= impulse_friction;
	impulse_force_y *= impulse_friction;
}
else
{
	impulse_force_x = 0;
	impulse_force_y = 0;		
}

// Always goes back to zero
constant_force_x = 0;
constant_force_y = 0;
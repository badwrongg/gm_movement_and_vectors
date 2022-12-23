x += velocity_x;
y += velocity_y;

ds_list_clear(hit_list);
var _count = collision_line_list(xprevious, yprevious, x, y, __hurtbox, true, true, hit_list, false),
	_hit = 0;

// Apply damage to what was hit
for (var _i = 0, _id; _i < _count; _i++)
{
	_id = hit_list[| _i];
	if (_id.team == team)
		continue;
		
	_id.receive_impulse_position(xstart, ystart, knockback_power);
	_hit += _id.receive_damage(damage, team);
}

// Play impact if something was hit
if (_hit)
	sprite_index = impact_animation;
else
	alarm[0] = 1;
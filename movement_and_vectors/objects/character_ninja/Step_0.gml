var _grav   = C_GRAVITY,
	_spr    = sprite_index,
	_index  = image_index,
	_xscale = image_xscale;

input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));

if (keyboard_check_pressed(vk_space))
	jump_remember = C_REMEMBER_FRAMES;
	
if (mouse_check_button_pressed(mb_left))
	slash_remember = C_REMEMBER_FRAMES;
	
if (mouse_check_button_pressed(mb_right))
	throw_remember = C_REMEMBER_FRAMES;

action_state.update(id);

#region Locomotion

	if (on_vertical)
	{
		// Normal friction
		move_friction = 1;
	
		if (jump_remember)
		{
			_spr = spr_ninja_jump;
			add_impulse_direction(90 - 25 * input_x, 300);
			jump_remember = 0;
			on_vertical = 0;
		}
		else if (move_speed > 0)
			_spr = spr_ninja_run
		else
			_spr = spr_ninja_idle;
	}
	else
	{
		// Air control
		move_friction = 0.5;
	
		if (on_horizontal == 0)
		{
			_spr = spr_ninja_jump;
		
			if (velocity_y < 0)
			{
				// Jump animation going up
				_index = min(_index, 3);
			
				// Variable jump height
				if (!keyboard_check(vk_space))
					impulse_force_y *= C_VARIABLE_JUMP_FRICTION;
			}	
			else // Jump animation going down
				_index = min(_index, image_number - 1);
		}
		else
		{
			if (jump_remember)
			{
				// Wall jump
				_spr = spr_ninja_jump;
				add_impulse_direction(90 + sign(on_horizontal) * 25, 300);
				jump_remember = 0;
				on_horizontal = 0;
			}
			else if (velocity_y > 0)
			{
				// Slide down wall slow
				_spr = (input_x == sign(on_horizontal) ? spr_ninja_slide : spr_ninja_jump);
				_grav *= C_ON_WALL_FRICTION;
			}
			else
				_index = min(_index, 3);
		}
	}

	// Platformer gravity
	add_constant_force(270, _grav);

	if (input_x != 0)
	{
		_xscale = sign(input_x);
		add_movement_direction(darccos(input_x));
	}
	
#endregion

// Counters
jump_remember  = jump_remember >> 1;
slash_remember = slash_remember >> 1;
throw_remember = throw_remember >> 1;

// Action animation lets us override normal animation state
if (!action_animation)
{
	sprite_index = _spr;
	image_index  = _index;
	image_xscale = _xscale;
}

event_inherited();
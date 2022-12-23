function base_state(_this) constructor
{
	/* State enter code goes here */
	
	static update = function(_this) { /* Called each step */ }
	static finish = function(_this) { /* Called when exiting the state */ }
	static animation_broadcast = function(_this, _value) { /* Called on animation broadcasts */ }
	static animation_end = function(_this) { /* Called when animation ends */ }
}

function ninja_state_free(_this) : base_state(_this) constructor
{
	with (_this)
	{
		action_animation = false;
		if (input_x != 0)
			image_xscale = sign(input_x);
	}
	
	static update = function(_this)
	{
		with (_this)
		{
			if (slash_remember)
			{
				action_state_change(ninja_state_slash);
				slash_remember = 0;
			}
			else if (throw_remember)
			{
				action_state_change(ninja_state_throw);
				throw_remember = 0;
			}
		}
	}
}

function ninja_state_slash(_this) : base_state(_this) constructor
{
	hitbox = noone;
	
	with (_this)
	{
		action_animation = true;
		
		image_index  = 0;
		if (on_vertical)
		{
			sprite_index = spr_ninja_slash;
			add_impulse_direction(darccos(image_xscale), 10);
		}
		else
		{
			sprite_index = spr_ninja_slash_air;
			add_impulse_direction(90 - 20 * image_xscale, 20);
			if (on_horizontal != 0)
				image_xscale = -sign(on_horizontal);
		}
	}
	
	static update = function(_this)
	{
		with (_this)
		{
			if (on_vertical)
			{
				move_speed_mod = 0;
				sprite_index = spr_ninja_slash;
			}
			else
			{
				move_speed_mod -= 0.4;
				sprite_index = spr_ninja_slash_air;	
				if (on_horizontal != 0)
					image_xscale = -sign(on_horizontal);
			}
		}
	}
	
	static animation_broadcast = function(_this, _value) 
	{ 
		if (_value == e_broadcast.attack_start)
		{
			with (_this)
			{
				var _width = abs(sprite_width) >> 1,
					_hitbox = instance_create_depth(x + _width * image_xscale, y, depth - 1, __melee_attack,
					{
						owner  : id,
						team   : team,
						damage : 5,
						image_xscale : _width >> 1,
						image_yscale : sprite_height >> 1
					});
			}
			hitbox = _hitbox;
		}
		else if (_value == e_broadcast.attack_end && instance_exists(hitbox))
			instance_destroy(hitbox);
	}	
	
	static animation_end = function(_this) 
	{ 
		_this.action_state_change(ninja_state_free);
	}
}

function ninja_state_throw(_this) : base_state(_this) constructor
{
	with (_this)
	{
		action_animation = true;
		image_index  = 0;
		
		if (on_vertical)
		{
			sprite_index = spr_ninja_throw;
			add_impulse_direction(darccos(-image_xscale), 15);
		}
		else
		{
			sprite_index = spr_ninja_throw_air;
			add_impulse_direction(90 + 15 * image_xscale, 35);
			if (on_horizontal != 0)
				image_xscale = -sign(on_horizontal);
		}
		
	}
	
	static update = function(_this)
	{
		with (_this)
		{
			if (on_vertical)
			{
				move_speed_mod = 0;
				sprite_index = spr_ninja_throw;
			}
			else
			{
				move_speed_mod -= 0.5;
				sprite_index = spr_ninja_throw_air;
				if (on_horizontal != 0)
					image_xscale = -sign(on_horizontal);
			}
		}
	}
	
	static animation_broadcast = function(_this, _value) 
	{  
		if (_value == e_broadcast.attack_start)
			with (_this)
				instance_create_depth(x + sprite_xoffset, y, depth - 1, projectile_kunai,
				{
					owner  : id,
					team   : team,
					hspeed : image_xscale,
					image_xscale : image_xscale 
				});
	}	
	
	static animation_end = function(_this) 
	{  
		_this.action_state_change(ninja_state_free);
	}
}
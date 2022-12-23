var _len = point_distance(x, y, mouse_x, mouse_y),
	_xs  = _len / sprite_get_width(spr_tank_arrow);
	
// Arrow towards mouse
draw_sprite_ext(spr_tank_arrow, 0, x, y, _xs, 1, mouse_dir, c_white, 0.5);

// Actual aim position
draw_sprite_ext(spr_reticle, 0, x + lengthdir_x(_len, aim_dir), y + lengthdir_y(_len, aim_dir), 1, 1, 0, c_white, 1);

// Tank and gun barrel on top
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, facing_dir, image_blend, image_alpha);
draw_sprite_ext(sprite_tank_barrel, 0, x, y, image_xscale, image_yscale, aim_dir, image_blend, image_alpha);

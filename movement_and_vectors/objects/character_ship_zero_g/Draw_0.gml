for (var _t = 0; _t < 4; _t++)
	if (thrust_dir[_t])
		draw_sprite_ext(spr_booster, 0, x, y, 1, 1, thrust_angle[_t] + 180, c_white, 1);
		
draw_self();

draw_sprite(spr_reticle, 0, mouse_x, mouse_y);
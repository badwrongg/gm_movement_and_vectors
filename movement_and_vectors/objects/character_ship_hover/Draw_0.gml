if (thrust)
	draw_sprite_ext(spr_booster, 0, x, y, 1, 2, 270 + tilt_angle, c_white, 1);
	
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, tilt_angle, c_white, 1);

draw_sprite(spr_reticle, 0, mouse_x, mouse_y);
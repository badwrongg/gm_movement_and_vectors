
if (thrust)
	draw_sprite_ext(spr_booster, 0, x, y, 1.4 + boost, 1, facing_dir - 180, c_white, 1);
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, facing_dir, c_white, 1);
draw_sprite_ext(spr_arrow, 0, mouse_x, mouse_y, 1, 1, point_direction(x, y, mouse_x, mouse_y), c_white, 1);
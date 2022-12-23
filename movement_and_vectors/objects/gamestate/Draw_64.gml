/// @description Character info

#macro NEWLINE _dy += 20

var _dy = 40;



with (character_list[| character_index])
{

	draw_text(40, _dy, "total velocity: " + string_format(velocity, 5, 3)); NEWLINE;
	draw_text(40, _dy, "move_speed:     " + string_format(move_speed, 5, 3)); NEWLINE;
	draw_text(40, _dy, "impulse_force:  " + string_format(point_distance(0, 0, impulse_force_x, impulse_force_y), 5, 3)); NEWLINE;
	draw_text(40, _dy, "constant_force: " + string_format(point_distance(0, 0, constant_force_x, constant_force_y), 5, 3)); NEWLINE;	
	NEWLINE;

	draw_text(40, _dy, "Exit: Escape"); NEWLINE;
	draw_text(40, _dy, "Restart: F10"); NEWLINE;
	draw_text(40, _dy, "Select character: PGUP - PGDN"); NEWLINE;
	draw_text(40, _dy, "Zoom: Mouse Wheel"); NEWLINE;
	draw_text(40, _dy, "Place bomb: F"); NEWLINE;
	
	draw_text(40, _dy, controls_text);
}
if (keyboard_check_pressed(vk_escape))
	game_end();
	
if (keyboard_check_pressed(vk_f10))
	room_restart();

// Place bombs
if (keyboard_check_pressed(ord("F")))
	instance_create_layer(mouse_x, mouse_y, layer, hazard_bomb);
	
// Cycle through character list and deactivate/activate
var _select = keyboard_check_pressed(vk_pagedown) - keyboard_check_pressed(vk_pageup);
if (_select != 0)
{
	var _list = character_list,
		_size = ds_list_size(_list);
	
	instance_deactivate_object(_list[| character_index]);
	character_index = (character_index + _select + _size) mod _size;
	instance_activate_object(_list[| character_index]);
	game_camera.assign_follow(_list[| character_index]);
}
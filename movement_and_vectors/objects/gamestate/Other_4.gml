var _list = character_list;

with (__character)
	if (object_index != practice_ball)
		ds_list_add(_list, id);
	
for (var _i = 1, _size = ds_list_size(_list); _i < _size; _i++)
	instance_deactivate_object(_list[| _i]);
	
game_camera.assign_follow(_list[| 0]);
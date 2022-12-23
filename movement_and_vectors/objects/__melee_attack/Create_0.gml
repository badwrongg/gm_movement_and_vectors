var _x = x, 
	_y = y, 
	_angle;

with (owner)
{
	_x = (_x - x) / image_xscale;
	_y = (_y - y) / image_yscale;
	_angle = aim_dir;
}

x_off = _x;
y_off = _y;
image_angle = _angle;

tag_list = ds_list_create();

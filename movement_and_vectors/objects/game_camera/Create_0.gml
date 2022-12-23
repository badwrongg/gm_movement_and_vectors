// View and resolutions
#macro VIEW view_camera[0]
#macro VIEW_FULLSCREEN false
#macro VIEW_WIDTH  1920
#macro VIEW_HEIGHT 1080
#macro GUI_WIDTH   1920
#macro GUI_HEIGHT  1080

follow_x = x;
follow_y = y;
follow   = noone;

var _width  = display_get_width(),
	_height = display_get_height()
		
if (_width > _height)
{
	aspect = _height/_width;
	prefer_width = true;
	display_set_gui_size(GUI_WIDTH, GUI_WIDTH * aspect);
}
else 
{
	aspect = _width/_height;
	prefer_width = false;
	display_set_gui_size(GUI_HEIGHT * aspect, GUI_HEIGHT);
}
	
window_set_fullscreen(VIEW_FULLSCREEN);
window_set_size(_width, _height);
surface_resize(application_surface, _width, _height);

function update_follow()
{
	if (instance_exists(follow))
	{
		follow_x = follow.x;
		follow_y = follow.y;
		return;
	}
	
	follow = instance_nearest(x, y, follow_object);
}
	
function update_view()
{
	increment_zoom((mouse_wheel_down() - mouse_wheel_up()) * zoom_speed);
	
	if (prefer_width)
	{
		width  = (VIEW_WIDTH * zoom &~ 1);
		height = (width * aspect &~ 1);
	}
	else
	{
		height = (VIEW_HEIGHT * zoom &~ 1);
		width  = (height * aspect &~ 1);
	}
	
	width_half  = width  * 0.5;
	height_half = height * 0.5;
	
	x = clamp(follow_x - width_half, 0,  room_width - width);
	y = clamp(follow_y - height_half, 0, room_height - height);	
	
	camera_set_view_size(VIEW, width, height);
	camera_set_view_pos(VIEW, x, y);	
}
		
function set_position(_x, _y)
{
	x = _x;
	y = _y;
	update_view();
}

function assign_follow(_id)
{
	follow = _id;
	
	if (instance_exists(_id))
	{
		follow_x = follow.x;
		follow_y = follow.y;
	}
}

function increment_zoom(_increment)
{
	zoom = clamp(zoom + _increment * zoom_speed, zoom_speed, zoom_max);	
}

function set_zoom(_zoom)
{	
	zoom = clamp(_zoom, zoom_min, zoom_max);
}
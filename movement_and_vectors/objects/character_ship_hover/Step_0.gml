var _tilt = keyboard_check(ord("D")) - keyboard_check(ord("A"));
thrust = keyboard_check(vk_space);

add_impulse_direction(darccos(_tilt) ,  tilt_power * abs(_tilt));	
add_impulse_direction(90, thrust * thrust_power);
add_constant_force(270, C_GRAVITY);


var _pos = (impulse_force_x + 10) / 20; // Inverse lerp
tilt_angle = lerp(tilt_angle_size, -tilt_angle_size, clamp(_pos, - 1.2, 1.2));

event_inherited();
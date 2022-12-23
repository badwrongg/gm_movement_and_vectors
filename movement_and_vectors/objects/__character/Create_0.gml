event_inherited();

add_movement_input     = method(id, add_movement_input);
add_movement_direction = method(id, add_movement_direction);
add_impulse_position   = method(id, add_impulse_position);
add_impulse_direction  = method(id, add_impulse_direction);
add_constant_force     = method(id, add_constant_force);

move_x         = 0;
move_y         = 0;
move_dir       = 0;
move_speed     = 0;
move_norm_x    = 0;
move_norm_y    = 0;
move_speed_mod = 1;
move_friction  = 1;

impulse_force_x  = 0;
impulse_force_y  = 0;
impulse_friction = 0.85;
impulse_mod      = 1;

constant_force_x = 0;
constant_force_y = 0;

velocity_x = 0;
velocity_y = 0;
velocity = 0;

controls_text = "Unassigned";

aim_dir = 0;
hurtbox = create_hurtbox(id, team, hitpoints, sprite_width, sprite_height);
event_inherited();

aim_cos = 0;
aim_sin = 0;
aim_x   = 0;
aim_y   = 0;
aim_turn_speed = 2;
mouse_dir = 0;

facing_dir = 0;
facing_turn_speed = 1.5;

gun_length = sprite_get_width(spr_tank_barrel) - sprite_get_xoffset(spr_tank_barrel);

controls_text = 
@"
Forward/Reverse: W - S
Rotate: A - D
Fire: Left Mouse
";
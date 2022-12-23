event_inherited();

#macro C_ON_WALL_FRICTION 0.6
#macro C_VARIABLE_JUMP_FRICTION 0.8
#macro C_REMEMBER_FRAMES (1 << 15) // uses binary counter

jump_remember  = 0;
slash_remember = 0;
throw_remember = 0;
input_x = 0;

action_state = new ninja_state_free(id);
action_animation = false;

controls_text = 
@"
Move Left/Right: A - D
Jump: Space
Attack: Mouse Left
Throw: Mouse Right
";

function action_state_change(_state)
{
	action_state.finish(id);
	action_state = new _state(id);
}
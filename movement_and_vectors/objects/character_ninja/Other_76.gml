enum e_broadcast
{
	attack_start,
	attack_end
}

if (layer_instance_get_instance(event_data[? "element_id"]) != id)
	exit;

if (event_data[? "event_type"] == "sprite event")
{
	switch (event_data[? "message"])
	{
		case "attack_start":
			action_state.animation_broadcast(id, e_broadcast.attack_start);
		break;
		
		case "attack_end":
			action_state.animation_broadcast(id, e_broadcast.attack_end);
		break;
	}
}
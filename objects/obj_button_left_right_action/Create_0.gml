
left_button = instance_create_depth(bbox_left, y, depth - 1, obj_button,
{
	image_yscale : image_yscale,
	image_xscale : image_xscale/2,
	click_action : left_action,
	hold_action	: left_action_held,
	label : left_label,
	logo : left_logo
});

with (left_button) { 
	x += (x - bbox_right);
	instance_deactivate_object(id);
}

right_button = instance_create_depth(bbox_right, y, depth - 1, obj_button,
{
	image_yscale : image_yscale,
	image_xscale : image_xscale/2,
	click_action : right_action,
	hold_action	: right_action_held,
	label : right_label,
	logo : right_logo
});

with (right_button) { 
	x += (x - bbox_left);
	instance_deactivate_object(id);
}
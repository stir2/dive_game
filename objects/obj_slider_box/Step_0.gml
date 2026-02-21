/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button(mb_left)){
	var _length = bbox_right - bbox_left;
	var _normal = (mouse_x - bbox_left)/_length;
    currVal = round(_normal * colorMax);
	slider_x = _normal * _length;
}
/// @description Insert description here
// You can write your code in this editor
if(position_meeting(mouse_x, mouse_y, id) && curr_level < max_level){
	if(mouse_check_button_pressed(mb_left) && click_buff <= 0){
		buy();
		click_buff = buffer_time;
	}
	sprite_index = spr_shop_item_highlighted;
}else{sprite_index = spr_shop_item;}
if(click_buff > 0){click_buff--;}
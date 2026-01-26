/// @description Insert description here
// You can write your code in this editor
if(position_meeting(x, y, obj_player)){
	if(room != Shop){
		global.levels_beaten++;
		global.item_level_cap++;
		global.sanddollars = obj_player.sanddollars;
		room_goto(Shop);
	}
	else{
		global.sanddollars = obj_player.sanddollars;
		switch(global.levels_beaten){
			case 1: room_goto(Level2); break;
			case 2: room_goto(Level3); break;
			case 3: room_goto(Boss); break;
		}
	}
}
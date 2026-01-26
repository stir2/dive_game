PARALLAX_RATIO_WIDTH =  1//abs( bbox_right)/room_width;
PARALLAX_RATIO_HEIGHT = 1//abs(bbox_top - bbox_bottom)/room_height;
initialized = false;

bg_origin = [obj_player.x - 10, obj_player.y - 10];

x = obj_player.x;
y = obj_player.y;
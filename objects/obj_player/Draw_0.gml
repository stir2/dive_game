draw_self();

draw_healthbar(bbox_left - 16, bbox_top, bbox_left - 8, bbox_bottom, (air_level/tank_size) * 100, c_white, c_red, c_green, 3, true, true);
draw_text(x, bbox_top - 10, "air: " + string(air_level));
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
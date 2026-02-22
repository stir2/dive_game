/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_credits, 0, x, y - 150);
draw_self();
draw_text_transformed(x, y, "exit credits", .5, .5, 0);
if(my_controller.using_controller){draw_sprite(spr_title_menu_button_highlight, 0, x, y);}
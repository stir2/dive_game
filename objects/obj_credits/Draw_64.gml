/// @description Insert description here
// You can write your code in this editor
/*
JonVincent Uy - Character Animation

Stephanie Okotie - Character design/ Concept art, Storyboard Artist

Hailey Michel - Background Artist/ Concept Art, Level Tiling

Onyae' Stewart - Programming, Music, Level Design

Bryan Sandoval - Programming, Additional Level Design 

Stirling Gould - Programming, Level Tiling

*/
draw_sprite(spr_credits, 0, x, y - 150);
draw_text_transformed(x - 170, y - 300, "JonVincent Uy - Character Animation", .5, .5, 0);
draw_text_transformed(x - 170, y - 250, "Stephanie Okotie - Character design/ Concept art, Storyboard Artist", .5, .5, 0);
draw_text_transformed(x - 170, y - 200, "Hailey Michel - Background Artist/ Concept Art, Level Tiling", .5, .5, 0);
draw_text_transformed(x - 170, y - 150, "Onyae' Stewart - Programming, Music, Level Design", .5, .5, 0);
draw_text_transformed(x - 170, y - 100, "JonVincent Uy - Character Animation", .5, .5, 0);
//draw_text_transformed(x - 170, y - 70, "Programming, Level Tiling"
draw_text_transformed(x - 170, y - 50, "Stirling Gould", .5, .5, 0);

draw_self();
draw_text_transformed(x, y, "exit credits", .5, .5, 0);
if(my_controller.using_controller){draw_sprite(spr_title_menu_button_highlight, 0, x, y);}
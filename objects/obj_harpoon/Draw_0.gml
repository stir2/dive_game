/// @description Insert description here
// You can write your code in this editor
draw_self();
if(state == state_point){draw_text(300, 300, "point");}
if(state == state_throw){draw_text(300, 300, "throw");}
if(state == state_reel){draw_text(300, 300, "reel");}
if(state == state_hit){draw_text(300, 300, "hit");}
draw_text(x, y, string(x_movement) + ", " + string(y_movement));
draw_text(x, y + 20, angle);
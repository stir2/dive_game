/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
if(state == statePoint){draw_text(300, 300, "point");}
if(state == stateThrow){draw_text(300, 300, "throw");}
if(state == stateReel){draw_text(300, 300, "reel");}
if(state == stateHit){draw_text(300, 300, "hit");}
draw_circle(x, y, 2, true);

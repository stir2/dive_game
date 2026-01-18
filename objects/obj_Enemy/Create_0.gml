// Inherit the parent event
event_inherited();

//Hurtbox Creation
hp = 1;
myHurtbox = instance_create_depth(x, y, 0, obj_HurtBox, new HurtBox(id, true, bbox_left, bbox_top, bbox_right, bbox_bottom));
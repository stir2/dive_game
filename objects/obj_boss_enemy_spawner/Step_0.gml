/// @description Insert description here
// You can write your code in this editor
if(lifetime <= 0){
	instance_create_layer(x, y, "Instances", choose(obj_enemy_urchin, obj_enemy_lionfish, obj_enemy_piranha, obj_enemy_angler, obj_enemy_eel, obj_enemy_shark));
	instance_destroy();
}
lifetime--;
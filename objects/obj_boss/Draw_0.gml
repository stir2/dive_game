/// @description Insert description here
// You can write your code in this editor
draw_self();
if (state = state_enemy_spawn){
	for(var _i = 0; _i < array_length(enemy_spawn_pos); _i++){
		if(_i >= spawn_pos_index){
			draw_sprite(spr_boss_enemy_incoming, 0, enemy_spawn_pos[_i].ex, enemy_spawn_pos[_i].ey);
		}
	}
}
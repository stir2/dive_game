/// @description Insert description here
// You can write your code in this editor
event_inherited();
hp_max = 20
hp = hp_max;
attacked = false

myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left + 20, bbox_top + 35, bbox_right - 20, bbox_bottom - 35], 1, knock_back_amount, undefined,0,0,0,[obj_player],,,-1,,60))
move_speed = 4;
move_speed_max = 10;

arm_l = instance_create_layer(1104, 880, "Instances", obj_boss_arm_L);
arm_r = instance_create_layer(1392, 880, "Instances", obj_boss_arm_R);
curr_seq = noone;

attack_speed_adjusted_half_health = false;
attack_speed_adjusted_fourth_health = false;

attack_cooldown = 60 * 5;
attack_cool_timer = 0;
enemy_attack_index = 0;
state_idle = function(){
	if(attack_cool_timer <= 0){
		switch(enemy_attack_index){
			case 0 : state = state_enemy_spawn; break;
			case 1 : state = state_swing; break;
			case 2 : state = state_spikes; break;
			case 3 : state = state_slam; break;
		}
		
		if(enemy_attack_index >= 3){enemy_attack_index = 0;}
		else{enemy_attack_index++;}
		
		attack_cool_timer = attack_cooldown;
	}
	attack_cool_timer--;
	sprite_index = spr_boss_head_idle;
}

spawn_time = 20;
spawn_counter = spawn_time;
okay_to_spawn = true; //are there few enough enemies to spawn during the spawn attack?
spawn_okay_checked = false;
enemy_spawn_pos = [
{ex : 992, ey : 592},
{ex : 1008, ey : 1280},
{ex : 1504, ey : 1280},
{ex : 1504, ey : 592},
];
spawn_pos_index = -1;
state_enemy_spawn = function(){
	//spawn in random enemies (if few){
	if(!spawn_okay_checked){
		okay_to_spawn = instance_number(obj_Enemy) <= 2;
		spawn_okay_checked = true;
	}
	
	if(okay_to_spawn){
		if(spawn_counter <= 0){
			spawn_pos_index++;
			if(spawn_pos_index < array_length(enemy_spawn_pos)){
				instance_create_layer(enemy_spawn_pos[spawn_pos_index].ex, enemy_spawn_pos[spawn_pos_index].ey, "Instances", obj_boss_enemy_spawner);
			}
			spawn_counter = spawn_time;
		}
		spawn_counter--;
	}

	
	//play animation
	if(!in_sequence){
		 if(!attacked){
			var _seq = layer_sequence_create("Instances", x, y, seq_spines);
			var _seqStuct = layer_sequence_get_instance(_seq);
			curr_seq = _seq;

			sequence_instance_override_object(_seqStuct, obj_boss, id);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_L, arm_l);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_R, arm_r);
			

			layer_sequence_play(_seq);
			attacked = true;
		 }else{
			 if(layer_sequence_exists("Instances", curr_seq)){layer_sequence_destroy(curr_seq);}
			 attacked = false;
			 state = state_idle;
			 spawn_pos_index = 0;
			 spawn_okay_checked = false;
			 spawn_counter = spawn_time;
		 }
	}
	sprite_index = spr_boss_head_roar;
}

rocks_x = [752, 1104, 1440, 1766];
shuffled_rocks_x = [];
rocks_shuffled = false;
rock_spawn_cooldown = 20;
rock_spawn_begin_timer = 50;
rock_spawn_timer = rock_spawn_begin_timer;
rock_spawn_index = 0;
state_slam = function(){
	if(!rocks_shuffled){
		shuffled_rocks_x = array_shuffle(rocks_x);
		rocks_shuffled = true;
	}
	if(rock_spawn_timer <= 0 && rock_spawn_index < array_length(shuffled_rocks_x)){
		instance_create_layer(shuffled_rocks_x[rock_spawn_index], -512, "Instances", obj_boss_rock);
		rock_spawn_index++;
		rock_spawn_timer = rock_spawn_cooldown;
	}
	rock_spawn_timer--;	
	
	if(!in_sequence){
		 if(!attacked){
			var _seq = layer_sequence_create("Instances", x, y, seq_slam);
			var _seqStuct = layer_sequence_get_instance(_seq);
			curr_seq = _seq;
			
			sequence_instance_override_object(_seqStuct, obj_boss, id);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_L, arm_l);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_R, arm_r);
			

			layer_sequence_play(_seq);
			attacked = true;
		 }else{
			 if(layer_sequence_exists("Instances", curr_seq)){layer_sequence_destroy(curr_seq);}
			 attacked = false;
			 rocks_shuffled = false;
			 rock_spawn_index = 0;
			rock_spawn_timer = rock_spawn_begin_timer;
			 state = state_idle;
		 }
	}
	sprite_index = spr_boss_head_idle;
}

spike_cooldown = 5;
spike_cool_timer = spike_cooldown;
spike_angle_default = 90;
spike_angle = spike_angle_default;
angle_inc = 35;
state_spikes = function(){
	if(spike_cool_timer <= 0){
		instance_create_layer(x, y, "Instances", obj_boss_spike, {angle : spike_angle});
		spike_angle -= angle_inc;
		spike_cool_timer = spike_cooldown;
	}
	spike_cool_timer--;
	
	if(!in_sequence){
		 if(!attacked){
			var _seq = layer_sequence_create("Instances", x, y, seq_spines);
			var _seqStuct = layer_sequence_get_instance(_seq);

			sequence_instance_override_object(_seqStuct, obj_boss, id);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_L, arm_l);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_R, arm_r);
			curr_seq = _seq;

			layer_sequence_play(_seq);
			attacked = true;
		 }else{
			 if(layer_sequence_exists("Instances", curr_seq)){layer_sequence_destroy(curr_seq);}
			 attacked = false;
			 state = state_idle;
			 spike_angle = spike_angle_default;
			 spike_cool_timer = spike_cooldown;
		 }
	}
	sprite_index = spr_boss_head_idle;
}
bubble_spawn_time = 5;
bubble_spawning_begin_time = 35;
bubble_spawn_counter = bubble_spawning_begin_time;
bubble_spawn_pos_index = 0;
bubble_spawn_pos_L = [
{bx: 860, by: 976},
{bx: 832, by: 848},
{bx: 896, by: 672}
]

bubble_spawn_pos_R = [
{bx: 1636, by: 976},
{bx: 1664, by: 848},
{bx: 1600, by: 672}
]
swing_right = false;
swing_side_set = false;
state_swing = function(){
	if(!swing_side_set){swing_right = obj_player.x > x; swing_side_set = true;}
	//spawn bubbles
	if(bubble_spawn_counter <= 0){
		if(swing_right){
			if(bubble_spawn_pos_index < array_length(bubble_spawn_pos_R)){
				instance_create_layer(bubble_spawn_pos_R[bubble_spawn_pos_index].bx, bubble_spawn_pos_R[bubble_spawn_pos_index].by, "Instances", obj_bubble_medium);
			}
		}
		else{
			if(bubble_spawn_pos_index < array_length(bubble_spawn_pos_L)){
				instance_create_layer(bubble_spawn_pos_L[bubble_spawn_pos_index].bx, bubble_spawn_pos_L[bubble_spawn_pos_index].by, "Instances", obj_bubble_medium);
			}
		}
		bubble_spawn_pos_index++;
		bubble_spawn_counter = bubble_spawn_time;
	}
	bubble_spawn_counter--;
	
	//anims
	if(!in_sequence){
		 if(!attacked){
			var _seq = layer_sequence_create("Instances", x, y, swing_right ? seq_swing_right : seq_swing_left);
			var _seqStuct = layer_sequence_get_instance(_seq);

			sequence_instance_override_object(_seqStuct, obj_boss, id);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_L, arm_l);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_R, arm_r);
			curr_seq = _seq;

			layer_sequence_play(_seq);
			attacked = true;
		 }else{
			 if(layer_sequence_exists("Instances", curr_seq)){layer_sequence_destroy(curr_seq);}
			 attacked = false;
			 bubble_spawn_pos_index = 0;
			 bubble_spawn_counter = bubble_spawning_begin_time;
			 swing_side_set = false;
			 state = state_idle;
		 }
	}
	sprite_index = spr_boss_head_idle;
}

state = state_idle;

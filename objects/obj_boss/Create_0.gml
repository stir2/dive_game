/// @description Insert description here
// You can write your code in this editor
event_inherited();
hp = 20;
attacked = false

myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left + 20, bbox_top + 35, bbox_right - 20, bbox_bottom - 35], 1, knock_back_amount, undefined,0,0,0,[obj_player],,,-1,,60))
move_speed = 4;
move_speed_max = 10;

arm_l = instance_create_layer(1104, 880, "Instances", obj_boss_arm_L);
arm_r = instance_create_layer(1392, 880, "Instances", obj_boss_arm_R);

state_idle = function(){
	if(keyboard_check_pressed(ord("Z"))){state = state_slam;}
	if(keyboard_check_pressed(ord("X"))){state = state_spikes;}
	if(keyboard_check_pressed(ord("C"))){state = state_swing;}
}

state_slam = function(){
	if(!in_sequence){
		 if(!attacked){
			var _seq = layer_sequence_create("Instances", x, y, seq_slam);
			var _seqStuct = layer_sequence_get_instance(_seq);

			sequence_instance_override_object(_seqStuct, obj_boss, id);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_L, arm_l);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_R, arm_r);
			

			layer_sequence_play(_seq);
			attacked = true;
		 }else{
			 attacked = false;
			 state = state_idle;
		 }
	}
}

state_spikes = function(){
	if(!in_sequence){
		 if(!attacked){
			var _seq = layer_sequence_create("Instances", x, y, seq_spines);
			var _seqStuct = layer_sequence_get_instance(_seq);

			sequence_instance_override_object(_seqStuct, obj_boss, id);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_L, arm_l);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_R, arm_r);
			

			layer_sequence_play(_seq);
			attacked = true;
		 }else{
			 attacked = false;
			 state = state_idle;
		 }
	}
}

state_swing = function(){
	if(!in_sequence){
		 if(!attacked){
			var _seq = layer_sequence_create("Instances", x, y, obj_player.x > x ? seq_swing_right : seq_swing_left);
			var _seqStuct = layer_sequence_get_instance(_seq);

			sequence_instance_override_object(_seqStuct, obj_boss, id);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_L, arm_l);
			sequence_instance_override_object(_seqStuct, obj_boss_arm_R, arm_r);
			

			layer_sequence_play(_seq);
			attacked = true;
		 }else{
			 attacked = false;
			 state = state_idle;
		 }
	}
}

state = state_idle;

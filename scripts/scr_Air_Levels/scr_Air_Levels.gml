function add_player_air(_num){
	if(!instance_exists(obj_player)){
		return -1;
	}
	p = obj_player;
	
	if(p.air_level + _num > p.tank_size){
		p.air_level = p.tank_size;
	} else {
		p.air_level += _num;
	}
}
if(life_counter <= 0){instance_destroy();}

x += cos((angle * pi)/180) * movement_speed;
y += -sin((angle * pi)/180) * movement_speed;

life_counter--;
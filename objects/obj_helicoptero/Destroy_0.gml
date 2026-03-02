screen_shake(3);

repeat (3) {
    cria_particula(spr_explosao_insana, x+random_range(-sprite_width/2, sprite_width/2), y, -y);	
    cria_particula(choose(spr_part_fumaca, spr_part_fumaca2), x+random_range(-sprite_width/2, sprite_width/2), y, -y-1);	
}


var _range = 40;

repeat (4+global.numwave) {
    instance_create_depth(x+lengthdir_x(random_range(-_range, _range), random_range(0, 359)), y+lengthdir_y(random_range(-_range, _range), random_range(0, 359)), depth-1, choose(obj_dinheiro1, obj_dinheiro2));	
}

play_sound(snd_explode, .5, 1.1, false);
if (keyboard_check_pressed(ord("Y"))){
    repeat (2) {
    	checa_livres();
    }
    
    checa_livres(array_arvs, obj_arv_grande);
}

global.blocos_qnt = instance_number(obj_bloco1x1);

if (mouse_check_button_pressed(mb_right)){
    var _ball = instance_create_depth(mouse_x, mouse_y, depth, obj_bola);
    
    _ball.vspd = -6;
    _ball.hspd = random_range(-1, 1);
}

if (keyboard_check_pressed(vk_escape)){
    game_restart();
}
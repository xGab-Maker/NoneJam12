if (room != rm_menu){
    if (keyboard_check_pressed(vk_escape)){
        global.pause = !global.pause;
        pause = global.pause;
        global.para_sobe = pause;
    }
}

if (global.pause and pause){
    al_1 = lerp(al_1, .5, .15);
    
    if (al_1 >= .45){
        al_2 = lerp(al_2, 1, .15);
    }
}else{
    al_1 = lerp(al_1, 0, .15);
    al_2 = lerp(al_2, 0, .15);
}
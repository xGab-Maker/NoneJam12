randomize();

if (treme > .01){
    view_set_xport(view_camera[0], random_range(-treme, treme));
    view_set_yport(view_camera[0], random_range(-treme, treme));
    
    treme = lerp(treme, 0, .1);
}else{
    treme = 0;
}
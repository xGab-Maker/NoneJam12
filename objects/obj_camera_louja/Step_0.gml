if (lerpado){
    xx = lerp(xx, objx-(cw/2)*tam, qnt_lerp);
    yy = lerp(yy, objy-(ch/2)*tam, qnt_lerp);
}else{
    xx = objx-(cw/2)*tam;
    yy = objy-(ch/2)*tam;
}

x = xx;
y = yy;

tamcw = lerp(tamcw, cw*tam, .1);
tamch = lerp(tamch, ch*tam, .1);

camera_set_view_pos(view_camera[0], xx, yy);
camera_set_view_size(view_camera[0], tamcw, tamch);
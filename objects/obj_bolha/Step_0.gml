if (instance_exists(obj_player)){
    x = obj_player.x;
    y = obj_player.y;
    
    depth = obj_player.depth-1;
}

image_alpha = lerp(image_alpha, 1, .15);

image_xscale = elastic("xs", image_xscale, 1);
image_yscale = elastic("ys", image_yscale, 1);
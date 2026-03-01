var _range = 40;

repeat (4+global.numwave) {
    instance_create_depth(x+lengthdir_x(random_range(-_range, _range), random_range(0, 359)), y+lengthdir_y(random_range(-_range, _range), random_range(0, 359)), depth-1, choose(obj_dinheiro1, obj_dinheiro2));	
}
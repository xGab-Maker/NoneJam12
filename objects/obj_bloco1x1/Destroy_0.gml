global.mapa[cord[1]][cord[0]] = 0;

delete fogo;

instance_create_depth(x, y, depth-1, choose(obj_dinheiro2, obj_dinheiro1));

if (primeiro){
    var _range = 40;
    
    repeat (global.numwave) {
        instance_create_depth(x+lengthdir_x(random_range(-_range, _range), random_range(0, 359)), y+lengthdir_y(random_range(-_range, _range), random_range(0, 359)), depth-1, obj_dinheiro2);	
    }
}


global.blocos_quebrados++;
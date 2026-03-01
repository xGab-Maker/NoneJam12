if (global.pause) exit;

estado();

pointx = clamp(pointx, 0, array_length(global.mapa[0])-1);
pointy = clamp(pointy, 0, array_length(global.mapa)-1);

x += hspd;
y += vspd;

xscale = elastic("xs", xscale, 1);
yscale = elastic("ys", yscale, 1);

al_white = lerp(al_white, 0, .15);

if (estado == estado_anda or estado == estado_para) atira();

if (vida-vida_perd <= 0){
    if (suba == false){
        vspd = -5;
        
        estado = estado_morre_sobe;
        
        suba = true;
    }
}else{
    if (vida_predio != noone){
        var _x = x;
        var _y = y+sprite_height/2;
        
        with (vida_predio) {
        	x = _x;
            y = _y;
        }
    }
}
conjunto = [];

xscale = 1;
yscale = 1;
angle  = 0;

col_right = false;
col_left  = false;
col_up    = false;
col_down  = false;

checa_in = function(_id)
{
    for (var i = 0; i < array_length(conjunto); i++) {
    	if (conjunto[i] == _id){
            return true;
        }
    }
}

colisoes = function()
{
    var _add = 1;
    var _mask = 0;
    
    var _instlef = instance_place(x-_add, y, obj_bloco1x1);
    var _instrig = instance_place(x+_add, y, obj_bloco1x1);
    var _instup  = instance_place(x, y-_add, obj_bloco1x1);
    var _instdow = instance_place(x, y+_add, obj_bloco1x1);
    
    
    //Sistema de bit mask
    //Uso potencias de dois para evitar numeros iguais na hora da checagem
    if (_instlef){
        if (_instlef.image_blend == image_blend) _mask += 8;
    }
    if (_instrig){
        if (_instrig.image_blend == image_blend) _mask += 2;
    }
    if (_instup){
        if (_instup.image_blend == image_blend) _mask++;
    }
    if (_instdow){
        if (_instdow.image_blend == image_blend) _mask += 4;
    }
    
    image_index = _mask;
}

checa_colisoes = function()
{
    
}
conjunto = [];
cord     = [];
tipo     = noone;

auto_tile = function()
{
    var _add = 32;
    var _mask = 0;
    
    var _instlef = instance_place(x-_add, y, obj_rua);
    var _instrig = instance_place(x+_add, y, obj_rua);
    var _instup  = instance_place(x, y-_add, obj_rua);
    var _instdow = instance_place(x, y+_add, obj_rua);
    
    //Sistema de bit mask
    //Uso potencias de dois para evitar numeros iguais na hora da checagem
    if (_instlef) _mask += 2;
    if (_instrig) _mask += 4;
    if (_instup) _mask += 1;
    if (_instdow) _mask += 8;
    
    image_index = _mask;
}
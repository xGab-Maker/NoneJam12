conjunto = [];
cord     = [];
tipo     = noone;

rodou = false;

auto_tile = function(_obj)
{
    var _add = 32;
    var _mask = 0
    
    var _quem = _obj;
    
    var _instlef = instance_place(x-_add, y, _quem);
    var _instrig = instance_place(x+_add, y, _quem);
    var _instup  = instance_place(x, y-_add, _quem);
    var _instdow = instance_place(x, y+_add, _quem);
    
    var _instlefup   = instance_place(x-_add, y-_add, _quem);
    var _instlefdow  = instance_place(x-_add, y+_add, _quem);
    var _instrighup  = instance_place(x+_add, y-_add, _quem);
    var _instrighdow = instance_place(x+_add, y+_add, _quem);
    
    //Sistema de bit mask
    //Uso potencias de dois para evitar numeros iguais na hora da checagem
    if (_instlef) _mask += 8;
    if (_instrig) _mask += 16;
    if (_instup) _mask += 2;
    if (_instdow) _mask += 64;
            
    
    //Sistema de bit mask
    //Uso potencias de dois para evitar numeros iguais na hora da checagem
    if (_instlefup and _instlef and _instup) _mask += 1;
    if (_instlefdow and _instdow and _instlef) _mask += 32;
    if (_instrighup and _instup and _instrig) _mask += 4;
    if (_instrighdow and _instdow and _instrig) _mask += 128;
    
    var _ret = pega_numb(_mask);
    
    image_index = _ret;
}
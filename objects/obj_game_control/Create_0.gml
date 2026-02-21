randomize();

cria_bloco = function(_ind, _cor, _width, _height) constructor 
{
    indice = _ind;
    cor    = _cor;
    tamx   = _width;
    tamy   = _height;
}

width  = 5;
height = 5;

bloco1 = new cria_bloco(1, c_lime, 1, 1);
bloco2 = new cria_bloco(2, c_aqua, 3, 1);

if (!variable_global_exists("mapa")){
    global.mapa = [];
}

global.mapa = array_create(height, []);

for (var i = 0; i < width; i++) {
    global.mapa[i] = array_create(width, 0);
}

livres = [];

checa_livres = function()
{
    var _rand = -1;
    
    while (true) {
    	_rand = [irandom_range(1, width)-1, irandom_range(1, height)-1];
        
        if (global.mapa[_rand[0]][_rand[1]] == 0){
            break;
        }
    }
    
    show_message(_rand);
    
    var _spawn = choose(bloco1, bloco2);
    
    show_message(_spawn.indice);
    
    global.mapa[_rand[0]][_rand[1]] = _spawn.indice;
}
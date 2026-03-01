scribble_font_bake_outline_and_shadow("fnt_base", "fnt_escrita", 0, 4, SCRIBBLE_OUTLINE.NO_OUTLINE, 5, false);

scribble_font_bake_outline_and_shadow("fnt_louja", "fnt_louja_s", 0, 6, SCRIBBLE_OUTLINE.NO_OUTLINE, 2, false);

enum PODER {
	FOGO, // Feito
    MULTI, // Feito
    PERF, // Feito
    FRAG, // Feito
    LASER, // Feito 
    NORMAL // Feito
}

global.waves_qnt = [100, 300, 500, 750, 900];

global.blocos_qnt = 0;

global.progressao = 0;

global.bar_comb = 0;
global.add_bar_comb = 0;

global.pisca_des = false;

global.entra_other = false;

global.add_bar_pred = .5;

global.progress_pred = 0;

global.blocos_quebrados = 0;

global.combus_qnt = 1;

global.numwave = 1;

global.upg = {
    qnt_col : 4,
    dmg     : 1,
    combus  : 1,
    protect : 1,
    vel_ati : 1,
    tiroqnt : 1,
    velplay : 1,
    vel_tir : 5
}

global.upgorigin = {
    qnt_col : 4,
    dmg     : 1,
    combus  : 1,
    protect : 1,
    vel_ati : 1,
    tiroqnt : 1,
    velplay : 1,
    vel_tir : 5
}

global.cores = {
    black : #141527,
    white : #F7FFFD
}

global.money = {
    brain : 500,
    star  : 90    
}

global.width_map  = 12;
global.height_map = 7;

global.mapa = [];

global.mapa = array_create(global.height_map, []);

for (var i = 0; i < global.height_map; i++) {
    global.mapa[i] = array_create(global.width_map, 0);
}

global.quais = array_create(8, 0);

global.first_time = false;

global.last_pos = {
    py : 324,
    px : 0,
    gridpx : 0,
    gridpy : 0,
    sobep  : 0
}



















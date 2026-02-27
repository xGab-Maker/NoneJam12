scribble_font_bake_outline_and_shadow("fnt_base", "fnt_escrita", 0, 4, SCRIBBLE_OUTLINE.NO_OUTLINE, 5, false);

enum PODER {
	FOGO, // Feito
    MULTI, // Feito
    PERF, // Feito
    FRAG, // Feito
    LASER, //
    NORMAL // Feito
}

global.blocos_qnt = 0;

global.progressao = 0;

global.pisca_des = false;

global.cores = {
    black : #141527
}

global.width_map  = 12;
global.height_map = 7;

global.mapa = [];

global.mapa = array_create(global.height_map, []);

for (var i = 0; i < global.height_map; i++) {
    global.mapa[i] = array_create(global.width_map, 0);
}

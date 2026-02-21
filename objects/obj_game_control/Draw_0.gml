for (var i = 0; i < array_length(global.mapa); i++) {
	for (var j = 0; j < array_length(global.mapa[i]); j++) {
    	draw_text(50+(j*20), 50+(i*20), global.mapa[i][j]);
    }
}
#region Relacionadas Sprites


function muda_sprite(_spr = spr_fundo)
{
    if (sprite_index != _spr){
        image_index = 0;
        
        sprite_index = _spr;
    }
}

function fim_anim()
{
    var _spd = sprite_get_speed(sprite_index)/game_get_speed(gamespeed_fps);
    
    if (image_index + _spd >= image_number){
        return true;        
    }else{
        return false; 
    }
}


#endregion

#region Squash and Stratch


/// @desc Aplica um efeito de movimento elástico baseado em Lerp, mantendo uma variável interna persistente por instância. 
/// Permite que o valor acelere em direção ao alvo com o uma mola.
/// A função cria automaticamente uma variável intera única (por instância) com o nome fornecido, 
/// permitindo aplicar múltiplos efeitos elásticos no memos objeto sem conflito.
/// @param  {string} _nam Nome base da variável interna que será criada. Deve ser único para cada propriedade que usar o efeito.
/// @param  {any}    _val Valor atual que será suavizado pelo efeito.
/// @param  {any}    _tar Valor alvo que o movimento tenta alcançar.
/// @param  {real}   _for Intensidade da Força Elástica. Valores maiores aumentam o "puxão" inicial.
/// @param  {real}   _amt Suavização do movimento (0 a 1). Controla o quanto o valor interno se aproxima do objetivo a cada step.
/// @param  {real}   _ini Valor inicial da variável interna. Normalmente deixe 0.
/// @return {real}   Retorna o valor suavizado (_val + deslocamento_elástico).

function elastic (_nam, _val, _tar, _for=1, _amt=.25, _ini=0) {
    // ID do Objeto
    var _id  = id;
    // Variável Única
    var _var = "spring_" + string("{0}_{1}", _nam, _id);
    
    // Verifica se a Variável não existe
    if (!variable_instance_exists(_id, _var)) {
        // Cria a variável
        variable_instance_set(_id, _var, _ini);
    }
    
    // Pegando a variável criada e aplicando o efeito
    var _els = variable_instance_get(_id, _var);
    _els = lerp(_els, (_tar - _val) * _for, _amt);
     
    // Atualizando a variável criada
    variable_instance_set(_id, _var, _els);
     
    return _val + _els;
}

function inicia_squash()
{
    xscale  = 1;
    yscale  = 1;
    img_ang = 0;
}

function reseta_squash(_amt = .15, _elastic = false, _multi = 1)
{
    if (_elastic == false){
        xscale = lerp(xscale, 1, _amt);
        yscale = lerp(yscale, 1, _amt);
    }else{
        xscale = elastic("xscale", xscale, 1, _multi, _amt);
        yscale = elastic("yscale", yscale, 1, _multi, _amt);
    }
}

function usa_squash(_xs, _ys)
{
    xscale = _xs;
    yscale = _ys;
}

function draw_squash()
{
    draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, img_ang, image_blend, image_alpha);
}


#endregion

#region Others


function screen_shake(_impact)
{
    if (instance_exists(obj_screen_shake)){
        with (obj_screen_shake) {
        	treme = _impact;
        }
    }
}

function sine_wave(time, period, amplitude, midpoint) {
    return sin(time * 2 * pi / period) * amplitude + midpoint;
}

function sine_between(time, period, minimum, maximum) {
    var midpoint = mean(minimum, maximum);
    var amplitude = maximum - midpoint;
    return sine_wave(time, period, amplitude, midpoint);
}


#endregion
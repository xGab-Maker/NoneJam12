depth = -10003;

#region Shaders Rainbow

_uniUV         = shader_get_uniform(sh_rainbow, "u_uv");
_uniTime       = shader_get_uniform(sh_rainbow, "u_time");
_uniSpeed      = shader_get_uniform(sh_rainbow, "u_speed");
_uniSection    = shader_get_uniform(sh_rainbow, "u_section");
_uniSaturation = shader_get_uniform(sh_rainbow, "u_saturation"); 
_uniBrightness = shader_get_uniform(sh_rainbow, "u_brightness");
_uniMix        = shader_get_uniform(sh_rainbow, "u_mix");

_time  = 0;
_speed = 1.0;
_section = 0.5;
_saturation = 0.7;
_brightness = 0.8;
_mix = 0.5;

#endregion

cor = c_white;
qnt = 0;



colorido = false;
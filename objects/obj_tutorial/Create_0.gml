depth = -999999;

part_tutorial = 0;

escrita = "";

alp_txt = 0;
nalp_txt = 0;

xscale = 1;
yscale = 1;

passa = false;

blocks = false;

logica_pass = function()
{
    if (passa){
        alp_txt = lerp(alp_txt, 0, .15);
        
        if (alp_txt <= .01){
            part_tutorial++;
            
            if (part_tutorial >= 8){
                instance_destroy(self);
            }
            
            passa = false;
        }
    }else{
        alp_txt = lerp(alp_txt, 1, .15);
    }
}

true_pass = function()
{
    xscale = 1.2;
    yscale = .7;
    
    passa = true;
}
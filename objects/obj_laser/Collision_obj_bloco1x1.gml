if (array_get_index(atingidos, other.id) != -1) exit;
    
var _r1 = random_range(-10, -5);
var _r2 = random_range(-10, -5);

with (other) {
    alpha_branco = 1;
    angle = choose(_r1, _r2);
    
    if (inven == false and instance_exists(conjunto[0])){
        conjunto[0].vida_perdida += 1; 
        inven = true;
        
        cria_vida();
    }
}

array_push(atingidos, other.id);
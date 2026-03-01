var pos_x = 20;
var pos_y = 20;
var largura_barra = 200; 
var altura_barra = 20;   

var porcentagem = energia_atual / energia_maxima;


var cor_da_barra;

if (global.camuflado == true) {
    cor_da_barra = c_aqua;
} else if (poder == false) {
    cor_da_barra = c_red;     
} else {
    cor_da_barra = c_lime;    
}


draw_set_color(c_dkgray);
draw_rectangle(pos_x, pos_y, pos_x + largura_barra, pos_y + altura_barra, false);


draw_set_color(cor_da_barra);
draw_rectangle(pos_x, pos_y, pos_x + (largura_barra * porcentagem), pos_y + altura_barra, false);


draw_set_color(c_white);
draw_rectangle(pos_x, pos_y, pos_x + largura_barra, pos_y + altura_barra, true);


draw_set_color(c_white);

if (chaves > 0)
{
    var chave_x = 60; 
    

    var chave_y = 100; 
    

    draw_sprite_ext(sChavesBolso, 0, chave_x, chave_y, 3, 3, 0, c_white, 1);
}


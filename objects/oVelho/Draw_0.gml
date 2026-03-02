draw_self();


if (falando == true)
{

    draw_set_font(fnt_dialogo);
    draw_set_halign(fa_center); 
    draw_set_valign(fa_bottom); 
    
    var texto_completo = textos[pagina]; 
    var texto_parcial = string_copy(texto_completo, 1, floor(caracteres_escritos));
    
    var texto_x = x;
    var texto_y = y - 60;

    var escala = 0.35;
    var limite_largura = 350;
    
    var largura_caixa = string_width_ext(texto_parcial, -1, limite_largura) * escala;
    var altura_caixa = string_height_ext(texto_parcial, -1, limite_largura) * escala;
    var margem = 8;
    
    draw_set_color(c_black);
    draw_set_alpha(0.7); 
    draw_rectangle(texto_x - (largura_caixa / 2) - margem, 
                   texto_y - altura_caixa - margem, 
                   texto_x + (largura_caixa / 2) + margem, 
                   texto_y + margem, false);
    draw_set_alpha(1); 
    
    draw_set_color(c_white);
    draw_text_ext_transformed(texto_x, texto_y, texto_parcial, -1, limite_largura, escala, escala, 0);
    
    if (caracteres_escritos >= string_length(texto_completo))
    {
        draw_set_color(c_yellow);
        draw_text_transformed(texto_x + (largura_caixa / 2), texto_y + margem + 10, ">> E", escala, escala, 0);
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_color(c_white);
}
else if (instance_exists(oPlayer) && distance_to_object(oPlayer) <= distancia_interacao)
{
    draw_set_font(fnt_dialogo);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_yellow);
    

    draw_sprite(sBotaoE, 0, x, y - 40); 
    

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_font(-1);
}
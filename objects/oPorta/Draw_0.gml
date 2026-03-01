draw_self();


if (instance_exists(oPlayer))
{

    var distancia = distance_to_object(oPlayer);
    
 
    if (distancia <= 20 && oPlayer.chaves > 0 && sprite_index != sPortaAberta)
    {

        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_yellow);
        
        
        draw_text_transformed(x, y - 40, "[E]", 0.5, 0.5, 0);
        

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
    }
}
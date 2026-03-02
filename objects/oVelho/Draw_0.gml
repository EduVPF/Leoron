// 1. Desenha o NPC normalmente
draw_self();

// 2. Só desenha a caixa de texto se ele estiver falando
if (falando == true)
{
    // Configuração da fonte
    draw_set_font(fnt_dialogo); // Certifique-se de que é a sua fonte
    draw_set_halign(fa_center); 
    draw_set_valign(fa_bottom); 
    
    var texto_completo = textos[pagina]; 
    var texto_parcial = string_copy(texto_completo, 1, floor(caracteres_escritos));
    
    var texto_x = x;
    var texto_y = y - 60; // Altura do balão em relação à cabeça do NPC
    
    // ========================================================
    // A MÁGICA DA LARGURA E DO TAMANHO DA LETRA AQUI!
    // ========================================================
    var escala = 0.35;         // TAMANHO DA LETRA: Diminuí (antes devia ser 0.5 ou 1)
    var limite_largura = 350;  // LARGURA DA CAIXA: Aumentei bastante (antes devia ser uns 160)
    // ========================================================
    
    var largura_caixa = string_width_ext(texto_parcial, -1, limite_largura) * escala;
    var altura_caixa = string_height_ext(texto_parcial, -1, limite_largura) * escala;
    var margem = 8; // Espacinho preto sobrando em volta das letras
    
    // Desenha o Fundo Preto
    draw_set_color(c_black);
    draw_set_alpha(0.7); 
    draw_rectangle(texto_x - (largura_caixa / 2) - margem, 
                   texto_y - altura_caixa - margem, 
                   texto_x + (largura_caixa / 2) + margem, 
                   texto_y + margem, false);
    draw_set_alpha(1); 
    
    // Desenha as Letras Brancas
    draw_set_color(c_white);
    draw_text_ext_transformed(texto_x, texto_y, texto_parcial, -1, limite_largura, escala, escala, 0);
    
    // Mostra o ">> E" piscando quando a frase termina de digitar
    if (caracteres_escritos >= string_length(texto_completo))
    {
        draw_set_color(c_yellow);
        draw_text_transformed(texto_x + (largura_caixa / 2), texto_y + margem + 10, ">> E", escala, escala, 0);
    }
    
    // Limpa a sujeira do pincel para não bugar o resto do jogo
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1);
    draw_set_color(c_white);
}
// 3. SE NÃO ESTIVER FALANDO: Desenha o aviso para apertar E
else if (instance_exists(oPlayer) && distance_to_object(oPlayer) <= distancia_interacao)
{
    draw_set_font(fnt_dialogo);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_yellow);
    
    // Subi bastante (y - 70) para garantir que não fique escondido atrás do NPC
    // E dei uma leve aumentada nele (1.5) para chamar atenção
    draw_sprite(sBotaoE, 0, x, y - 40); 
    
    // Limpa o pincel
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_font(-1);
}
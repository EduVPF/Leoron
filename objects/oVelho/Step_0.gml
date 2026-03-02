if (instance_exists(oPlayer))
{
    var distancia = distance_to_object(oPlayer);

    if (distancia <= distancia_interacao)
    {
        
        if (keyboard_check_pressed(ord("E")))
        {
			image_xscale = -1
           if (falando == false)
            {
             
                falando = true;
                pagina = 0;
                caracteres_escritos = 0; 
            }
            else
            {
				
                var texto_completo = textos[pagina];
                

                if (caracteres_escritos < string_length(texto_completo))
                {
                    caracteres_escritos = string_length(texto_completo);
                }
                else
                {
 
                    pagina += 1;
                    caracteres_escritos = 0; 
                    
                    if (pagina >= array_length(textos))
                    {
                        falando = false;
                        pagina = 0;
						audio_stop_sound(sndvelho1);
                    }
                }
            }
        }
    }
    else
    {
		audio_stop_sound(sndvelho1)
  
        falando = false;
        pagina = 0;
        caracteres_escritos = 0;
    }

  
    if (falando == true)
    {

        if (caracteres_escritos < string_length(textos[pagina]))
        {
            // Salva o número da letra ANTES de somar
            var letra_anterior = floor(caracteres_escritos);
            
            // Aumenta a velocidade do texto
            caracteres_escritos += velocidade_texto;
            
            // Salva o número da letra DEPOIS de somar
            var letra_nova = floor(caracteres_escritos);
            
            // Se o número mudou, significa que uma letra nova apareceu na tela!
            if (letra_nova > letra_anterior)
            {
                // Pega qual foi a letra digitada
                var caractere = string_char_at(textos[pagina], letra_nova);
                
                // Só toca o som se não for um espaço em branco!
               if (caractere != " ")
        {
            // 1. MANDA O SOM ANTERIOR PARAR IMEDIATAMENTE!
            audio_stop_sound(sndvelho1); 
            
            // 2. TOCA O NOVO SOM LIMPINHO
            var voz = audio_play_sound(sndvelho1, 1, false);
            audio_sound_pitch(voz, random_range(0.9, 1.1));
        }
    }
    }
    }
	
}
 
 
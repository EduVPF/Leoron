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
                    }
                }
            }
        }
    }
    else
    {
  
        falando = false;
        pagina = 0;
        caracteres_escritos = 0;
    }

  
    if (falando == true)
    {
        if (caracteres_escritos < string_length(textos[pagina]))
        {
            caracteres_escritos += velocidade_texto;
        }
    }

 }
 
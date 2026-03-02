if (estado == "CUTSCENE")
{
    var texto_completo = textos[pagina];


    if (keyboard_check_pressed(ord("E")))
    {
        if (caracteres_escritos < string_length(texto_completo))
        {

            caracteres_escritos = string_length(texto_completo);
            

            audio_stop_sound(sndrei); 
        }
        else
        {

            pagina += 1;
            caracteres_escritos = 0; 
        }
    }

    if (pagina >= array_length(textos))
    {
        estado = "PARADO"; 
        timer = 60; 
        sprite_index = sJuca;
        audio_stop_sound(sndrei);
    }
    else
    {
		
        if (caracteres_escritos == 0)
        {
            audio_stop_sound(sndrei);
            audio_play_sound(sndrei, 1, false);
        }

        if (caracteres_escritos < string_length(textos[pagina]))
        {
            caracteres_escritos += velocidade_texto;
            

            if (caracteres_escritos >= string_length(textos[pagina]))
            {

                audio_stop_sound(sndrei);
            }
        }
    }
}

else if (estado == "PARADO")
{
    timer -= 1;
    if (timer <= 0)
    {
        estado = "PREPARANDO";
        timer = 20; 
        sprite_index = sJucaPreparo;
    }
}
else if (estado == "PREPARANDO")
{
    timer -= 1;
    if (timer <= 0)
    {
        estado = "PULANDO";
        v_speed = -10;
        sprite_index = sJucaPulo;

    }
}
else if (estado == "PULANDO")
{

    if (instance_exists(oPlayer))
    {
        var distancia_x = oPlayer.x - x;

        h_speed = clamp(distancia_x / 15, -6, 6); 
    }

    v_speed += grav;


    if (v_speed >= 0)
    {
        estado = "FLUTUANDO";

        timer = 15; 

        v_speed = 0;
        h_speed = 0; 
    }


    if (place_meeting(x + h_speed, y, oParede))
    {
        while (!place_meeting(x + sign(h_speed), y, oParede))
        {
            x += sign(h_speed);
        }
        h_speed = 0; 
    }
    x += h_speed;
    y += v_speed;
}

else if (estado == "FLUTUANDO")
{
    timer -= 1;

    x = x + choose(-1, 0, 1);
    
    if (timer <= 0)
    {
        estado = "CAINDO";
        v_speed = 2;
    }
}

else if (estado == "CAINDO")
{

    v_speed += grav * 2; 
	
    if (place_meeting(x, y + v_speed, oChao))
    {
        while (!place_meeting(x, y + sign(v_speed), oChao))
        {
            y += sign(v_speed);
        }
        
        v_speed = 0;
        estado = "ESMAGANDO";
        timer = 30; 
        sprite_index = sJucaCaindo; 
    }
    else
    {
        y += v_speed;
    }
	
}
else if (estado == "ESMAGANDO")
{

    timer -= 1;
    
    if (timer <= 0)
    {
        estado = "PARADO";
        timer = 20;
        sprite_index = sJuca;
    }
}
else if (estado == "MORTO")
{

    x = x_morte + choose(-4, 0, 4);
    y = y_morte + choose(-4, 0, 4);
    



    timer_morte -= 1;
    

    if (timer_morte <= 0)
    {

        effect_create_above(ef_explosion, x, y, 2, c_orange);
        

        instance_create_layer(x, y - 20, "Instances", oMosca);

        instance_destroy();
		instance_destroy(oBotaoJuca);
    }
}
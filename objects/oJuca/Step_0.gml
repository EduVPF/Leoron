if (estado == "CUTSCENE")
{
    if (keyboard_check_pressed(ord("E")))
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
        }
    }

    if (pagina >= array_length(textos))
    {
        estado = "PARADO"; 
        timer = 60; 
        sprite_index = sJuca;
    }
    else
    {
        if (caracteres_escritos < string_length(textos[pagina]))
        {
            caracteres_escritos += velocidade_texto;
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

        if (instance_exists(oPlayer))
        {
            var distancia_x = oPlayer.x - x;
            

            h_speed = clamp(distancia_x / 40, -6, 6); 
        }
    }
}
else if (estado == "PULANDO")
{
    v_speed += grav;


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

    if (v_speed > 0 && place_meeting(x, y, oChao))
    {

        while (place_meeting(x, y, oChao))
        {
            y -= 1;
        }
        
        v_speed = 0;
        h_speed = 0;
        estado = "ESMAGANDO";
        timer = 50; 
        sprite_index = sJucaCaindo;

        if (place_meeting(x, y + 1, oBotaoJuca))
        {

            vida -= 1
        }
    }
}
else if (estado == "ESMAGANDO")
{
    timer -= 1;
    if (timer <= 0)
    {
        estado = "PARADO";
        timer = 60; 
        sprite_index = sJuca; 
    }
}


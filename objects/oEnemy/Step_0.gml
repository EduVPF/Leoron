movimento();
checa_chao();
checa_parede();


if (place_meeting(x, y, oEspinhos) && estado != "MORTO")
{
    estado = "MORTO"; 
    

    move_speed = 0;   
    v_speed = 0;      
    
    sprite_index = sEnemyMorte; 
    image_index = 0; 
    
    audio_play_sound(snd_mortesapo, 10, false); 
}


if (estado == "MORTO")
{

    exit; 
}


ia_inimigo();
inputs();
checa_chao();
checa_parede();
movimento();
if (keyboard_check(ord("A")) && chao){
	image_xscale = -1;
	sprite_index = sPlayerANDANDO;
}
else if (keyboard_check(ord("D")) && chao){
	image_xscale = 1;
	sprite_index = sPlayerANDANDO;
}

if (global.camuflado == true)
{

    energia_atual -= 1;
    

    if (energia_atual <= 0)
    {
        energia_atual = 0;
        global.camuflado = false;
        poder = false;  
    }
}
else
{
    
    if (energia_atual < energia_maxima)
    {
        
        energia_atual += 2; 
    }
    else
    {
       
        energia_atual = energia_maxima;
		poder = true;
    }
}
if (keyboard_check_pressed(ord("E")))
{
   
    var porta_perto = instance_nearest(x, y, oPorta);
    
    
    if (porta_perto != noone && distance_to_object(porta_perto) <= 10)
    {
 
        if (chaves > 0 && porta_perto.sprite_index != sPortaAberta)
        {
            chaves -= 1;
            
          
            porta_perto.sprite_index = sPortaAberta; 
            

            porta_perto.mask_index = -1; 
        }
    }
}
if (chao == true)
{
    coyote_timer = coyote_max; 
}
else 
{
    coyote_timer -= 1;
}
if (tempo_invulneravel > 0)
{
    tempo_invulneravel -= 1;
    
    if (tempo_invulneravel % 10 < 5) {
        image_alpha = 0.3; 
    } else {
        image_alpha = 1;
    }
}
else
{
    image_alpha = 1; 
    
    var tomou_dano = false;
    var bateu_juca = instance_place(x, y, oJuca);
    if (bateu_juca != noone)
    {
        if (bateu_juca.estado != "MORTO") 
        {
            tomou_dano = true;
        }
    }
    var bateu_comum = instance_place(x, y, oEnemy);
    if (bateu_comum != noone)
    {
        tomou_dano = true;
    }
    
    if (tomou_dano == true)
    {
        vida -= 1;
        tempo_invulneravel = 60;

        v_speed = -3; 
		
		audio_play_sound(snddano, 1, false);
        
        if (vida <= 0)
        {
			audio_play_sound(sndmorte, 1, false);
            room_restart(); 
        }
    }
}

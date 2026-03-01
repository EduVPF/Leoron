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
show_debug_message(chaves);
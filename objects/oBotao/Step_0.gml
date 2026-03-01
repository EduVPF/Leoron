if (global.camuflado == true)
{
    image_alpha = 1;

}

else
{
    image_alpha = 0.3; 

}

if (global.camuflado == true)
{
    if (place_meeting(x, y - 1, oPlayer) || place_meeting(x, y, oPlayer))
    {
        var espinho_alvo = instance_nearest(x, y, oEspinhos);
        
        if (espinho_alvo != noone)
        {

            espinho_alvo.feitico_quebrado = true; 
            espinho_alvo.caindo = true;
        }
        sprite_index = sBotaoPressionado
    }
}
if (global.camuflado == true || feitico_quebrado == true)
{
    image_alpha = 1;
}
else
{
    image_alpha = 0.3; 
}


if (caindo == true)
{
    v_speed += grav;
    
    if (place_meeting(x, y + v_speed, oChao))
    {
        while (!place_meeting(x, y + sign(v_speed), oChao))
        {
            y += sign(v_speed);
        }
        v_speed = 0;
        caindo = false; 
    }
    else
    {
        y += v_speed;
    }
}


if (image_alpha == 1)
{
    if (place_meeting(x, y, oEnemy))
    {
        var sapo_alvo = instance_place(x, y, oEnemy);
	}
}
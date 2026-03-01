if (place_meeting(x, y, oPlayer))
{
if (!instance_exists(oTransicao))
    {

        instance_create_depth(0, 0, -9999, oTransicao); 
    }
}
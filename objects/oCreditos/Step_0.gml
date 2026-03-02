tempo_espera -= 1;

if (tempo_espera <= 0 || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
{
    room_goto(Menu);
}
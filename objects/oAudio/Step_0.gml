if (position_meeting(mouse_x, mouse_y, id)) {
	
	
	sprite_index = sAudioPress;
	
if	(mouse_check_button_pressed(mb_left))
{
	audio_play_sound(sndstart, 1, false);
    room_goto(audio); 
}
}
else {

sprite_index = sAudio;

}
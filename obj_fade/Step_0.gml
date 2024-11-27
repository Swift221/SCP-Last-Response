if (fade_n) { 
	alpha += s_speed;
	room_goto(room_cutscene);
	fade_n = false;
	transitioning = true;
	}
	
else if (transitioning) {
	alpha -= s_speed;
	 if (alpha <= 0) {
		 instance_destroy();
		 transitioning = false;
	 
	 }


}
	
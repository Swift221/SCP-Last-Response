//get inputs
down_key = keyboard_check_released(vk_down) + keyboard_check_pressed(ord("S"));
up_key = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W"));
left_key = keyboard_check_pressed(vk_left) + keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(vk_right) + keyboard_check_pressed(ord("D"));
accept_key = keyboard_check_pressed(vk_space);

depth = -9999;
//UNPAUSE FROM PRESSING ESCAPE WILL WORK LATER WHEN THE PLAYER CODE IS MORE DEVELOPED
if keyboard_check_pressed(vk_escape) {
	global.paused = false;
	instance_destroy();
}
	//store number of options in current menu
	op_length = array_length(option[menu_level]);
	//move through the menu
	pos += down_key - up_key;
	h_pos = right_key - left_key;
	//Loop through the menu
	if pos >= op_length { pos = 0 };
	if pos < 0 { pos = op_length - 1 };
	if (menu_level == CONTROLS) pos = 0;
	//Play sound effect if pressing right or left and in certain menu levels
	if (right_key || left_key) && (((menu_level == VIDEO || menu_level == SOUND) && pos != 0)) {
		audio_play_sound(Sound1_mouseclick, 0, false);
	}
	//use the options
	function process_menu() {
		if accept_key || (is_array(option[menu_level][pos]) && (h_pos != 0)) {
		
		var _start_menu_level = menu_level;
			
		switch(menu_level) {
			//Starting menu
			case MAIN:
				switch(pos) {
					//Resume
					case 0:
						audio_play_sound(Sound1_mouseclick, 0, false);
						global.paused = false;
						instance_destroy();
						break;
					//Settings
					case 1:
						audio_play_sound(Sound1_mouseclick, 0, false);
						menu_level =  SETTINGS; 
						break;
					//Return to main menu
					case 2:
						audio_play_sound(Sound1_mouseclick, 0, false);
						global.paused = false;
						room_goto(room_menu);
						instance_destroy();
						break;
					}
				break;
			//Settings menu
			case SETTINGS:
				switch(pos) {
					//Video
					case 0: 
						audio_play_sound(Sound1_mouseclick, 0, false);
						menu_level = VIDEO; 
						break;
					//Sound
					case 1:
						audio_play_sound(Sound1_mouseclick, 0, false);
						menu_level = SOUND;
						break;
					//Controls
					case 2: 
						audio_play_sound(Sound1_mouseclick, 0, false);
						menu_level = CONTROLS; 
						break;
					//Back
					case 3: 
						audio_play_sound(Sound1_mouseclick, 0, false);
						menu_level = MAIN; 
						break;
				}
			break;
			//Controls menu
			case CONTROLS:
				switch(pos) {
					//Back
					case 0: 
						audio_play_sound(Sound1_mouseclick, 0, false);
						menu_level = SETTINGS; 
						break; 
					//Up
					case 1: break;
					//Down
					case 2: break;
					//Left
					case 3: break;
					//Right
					case 4: break;
				}
			break;
			//Video menu
			case VIDEO:
				switch(pos) {
					//Back
					case 0:
						audio_play_sound(Sound1_mouseclick, 0, false);
						menu_level = SETTINGS; 
						break;
					//Text speed
					case 1: 
					change_menu(h_pos, "text_speed");
					break;
				}
			break;
			//Sound menu
			case SOUND:
				switch(pos) {
					//Back
					case 0: 
						audio_play_sound(Sound1_mouseclick, 0, false);
						menu_level = SETTINGS; 
						break;
					//SFX
					case 1: 
						change_menu(h_pos, "sfx"); 
						break;
					//Music
					case 2: 
						change_menu(h_pos, "music");
						break;
				}
			}
		//set position back
		if _start_menu_level != menu_level {pos = 0};
		//correct option length
		op_length = array_length(option[menu_level]);
		}
	}
	process_menu();
	
	function change_menu(_move, _key) {
		//@desc		change the ds map key entry by the move value passed
		//@_move		real			which way to move the selection
		//@_key			string			ds_map key for this selection
		
		//get the allowed limits for this selection
		//get map array
		var _map_arr = SET[? _key];
		//get the limits array
		var _limits_arr = _map_arr[1];
		
		//is the first entry in the limits an integer?
		if is_real(_limits_arr[0]) {
			//limits are index position 0 and 1
			limit_min = _limits_arr[0];
			limit_max = _limits_arr[1];
		} else {
			//string entries, limits are 0 and the size of the array -1
			limit_min = 0;
			limit_max = array_length(_limits_arr) - 1;
		}
		//move the selection
		_map_arr[@ 0]  = clamp(_move + _map_arr[0], limit_min, limit_max);
	}
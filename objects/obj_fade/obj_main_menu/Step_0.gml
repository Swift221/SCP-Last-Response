//get inputs
down_key = keyboard_check_released(vk_down) + keyboard_check_pressed(ord("S"));
up_key = keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W"));
accept_key = keyboard_check_pressed(vk_space) + keyboard_check_pressed(vk_enter);

//store number of options in current menu
op_length = array_length(option[menu_level]);
//move through the menu
pos += down_key - up_key;
if pos >= op_length { pos = 0 };
if pos < 0 { pos = op_length - 1 };
if (menu_level == 2) pos = 0;
//use the options
if accept_key {

var _start_menu_level = menu_level;
	
switch(menu_level) {
	//Starting menu
	case 0:
		switch(pos) {
			//Play
			case 0: room_goto(room_cutscene); break;
			//Settings
			case 1:
				menu_level = 1; break;
			//Credits
			case 2:  break;
			//Exit
			case 3: game_end(); break;
			}
		break;
	//Settings menu
	case 1:
		switch(pos) {
			//Video
			case 0: break;
			//Sound
			case 1: break;
			//Controls
			case 2: menu_level = 2; break;
			//Back
			case 3: menu_level = 0; break;
		}
	break;
	//Controls menu
	case 2:
		switch(pos) {
			//Back
			case 0: menu_level = 1; break; 
			//Up
			case 1: break;
			//Down
			case 2: break;
			//Left
			case 3: break;
			//Right
			case 4: break;
		}
	}
//set position back
if _start_menu_level != menu_level {pos = 0};
//correct option length
op_length = array_length(option[menu_level]);
}
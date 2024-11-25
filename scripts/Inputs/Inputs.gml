//Player inputs
	//clamp() sets the max value to 1 so that if you press both keys
	//(A and left arrow for example) the game wont give you double the speed
function Inputs(){
	key_left = keyboard_check(vk_left) + keyboard_check(ord("A"));
		key_left = clamp(key_left, 0, 1);
	key_right = keyboard_check(vk_right) + keyboard_check(ord("D"));
		key_right = clamp(key_right, 0, 1);
	key_up = keyboard_check(vk_up) + keyboard_check(ord("W"));
		key_up = clamp(key_up, 0, 1);
	key_down = keyboard_check(vk_down) + keyboard_check(ord("S"));
		key_down = clamp(key_down, 0, 1);
}
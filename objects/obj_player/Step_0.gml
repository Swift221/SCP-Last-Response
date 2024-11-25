//Get inputs
Inputs();
//Set the horizontal and vertical speed
	//X
	xspd = (key_right - key_left) * mov_spd;
	//Y
	yspd = (key_down - key_up) * mov_spd;
//Collisions
/////TO DO
//Move
x += xspd;
y += yspd;

//Set sprite
/////TO DO


//Depth
depth = -bbox_bottom;
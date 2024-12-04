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

// Handle collisions
// Check for collision in the X direction
if (!place_meeting(x + xspd, y, obj_walls)) {
    x += xspd;  // Move along X if no collision
} else {
    xspd = 0;  // Stop movement in X direction if collision detected
}

// Check for collision in the Y direction
if (!place_meeting(x, y + yspd, obj_walls)) {
    y += yspd;  // Move along Y if no collision
} else {
    yspd = 0;  // Stop movement in Y direction if collision detected
}


//Set sprite
/////TO DO


//Depth
depth = -bbox_bottom;


		
//Movement variables
xspd = 0;
yspd = 0;
mov_spd = 1;
//Pause variable
pause_delay = 0;
//STATES
fsm = new SnowState("walk");
		//Walk
		fsm.add("walk", {
			enter: function() {
				
			},
			step: function() {
				if (pause_delay > 0) {
					pause_delay--;
				}
				//Set the horizontal and vertical speed
				//X
				xspd = (key_right - key_left) * mov_spd;
				//Y
				yspd = (key_down - key_up) * mov_spd;

				//Move
				x += xspd;
				y += yspd;
				
				//SPRITE
				if key_up { sprite_index = mtf_front_walk; }
				if key_down { sprite_index = mtf_back_walk; }
				//Animate
				if xspd == 0 && yspd == 0 { image_index = 0; } //Stop animating if not moving
				
				//Collisions
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

				//Toggle pause (temporary)
				if keyboard_check_pressed(vk_escape) && (pause_delay <= 0) {
					global.paused = true;
					instance_create_depth(x, y, -9999, obj_pause_menu);
					fsm.change("paused");
				}
				//Set sprite
				/////TO DO
			},
			draw: function(){
				draw_self();
			},
			leave: function() {
				
			}
		});
		//Paused
		fsm.add("paused", {
			step: function() {
					image_speed = 0;
				//STATE CHANGE
				if global.paused == false {
					fsm.change("walk");
				}
			},
			draw: function() {
				draw_self();
			},
			leave: function() {
				image_speed = 1;
				pause_delay = 2;
			}
		});
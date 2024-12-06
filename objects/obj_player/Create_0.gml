//Movement variables
xspd = 0;
yspd = 0;
mov_spd = 4;
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
				//Collisions
				/////TO DO
				//Move
				x += xspd;
				y += yspd;

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
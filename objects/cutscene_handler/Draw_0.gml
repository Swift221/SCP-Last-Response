// Fade to black when the cutscene is done
if (cutscene_done) {
    var alpha = 1 - (cutscene_timer / 300); // Fade out
	draw_set_color(c_black);
    draw_set_alpha(alpha);
    draw_rectangle(0, 0, room_width, room_height,  true);

} else {
    // Draw the cutscene (e.g., background, characters, etc.)
    draw_self();
}
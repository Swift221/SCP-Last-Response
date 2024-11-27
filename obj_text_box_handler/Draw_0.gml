


// Draw Event for typing effect in obj_text_box

// Draw the text box (optional)
draw_set_color(c_grey);
draw_rectangle(text_box_x_h, text_box_y_h, text_box_x_h + text_box_width, text_box_y_h + text_box_height, true);

// Draw the typed text inside the box
draw_set_color(c_white);
for (var i = 0; i < array_length_1d(typed_text); i++) {
    var y_position = base_y_position + (i * line_y_offset); // Calculate Y position for each line
    draw_text(110, y_position, typed_text[i]); // Draw the typed text with a 10-pixel horizontal padding
}
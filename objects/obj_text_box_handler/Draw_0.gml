draw_set_color(c_white);
draw_rectangle(textbox_x, textbox_y, textbox_x + textbox_width, textbox_y + textbox_height, true);

// Manually draw the text line by line, with each line's Y position adjusted
if (line_index >= 0) {
    draw_text(textbox_x + 10, textbox_y + 10, string_copy(text_content[0], 1, char_index_1)); // First line
}

if (line_index >= 1) {
    draw_text(textbox_x + 10, textbox_y + 40, string_copy(text_content[1], 1, char_index_2)); // Second line
}

if (line_index >= 2) {
    draw_text(textbox_x + 10, textbox_y + 70, string_copy(text_content[2], 1, char_index_3)); // Third line
}
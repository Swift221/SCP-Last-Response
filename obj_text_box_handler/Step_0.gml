

// Increase the timer by the elapsed time
typing_timer += delta_time;

if (typing_timer >= typing_speed) {
    // Update typing for each line
    if (current_line < array_length_1d(text_content)) {
        // Type the current line
        if (char_index[current_line] < string_length(text_content[current_line])) {
            // Add the next character to the typed text
            typed_text[current_line] = string_copy(text_content[current_line], 1, char_index[current_line] + 1);
            char_index[current_line] += 1; // Increase the index for the current line

            // Reset the timer for the next character
            typing_timer = 0;
        } else {
            // Move to the next line after finishing typing the current one
            current_line += 1;
            char_index[current_line] = 0; // Reset the character index for the next line
        }
    }
}

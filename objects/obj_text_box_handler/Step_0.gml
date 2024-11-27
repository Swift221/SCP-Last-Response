// Step Event of obj_textbox

// If typing is not complete, continue typing
if (!typing_complete) {
    // Increment timer
    timer += 1;

    // If enough time has passed (based on typing_speed, converted to frames)
    if (timer >= typing_speed * 60) {  // 60 FPS, so multiply by 60 to get frames
        timer = 0;  // Reset the timer
        
        // Depending on which line is being typed, add characters
        if (line_index == 0 && char_index_1 < string_length(text_content[0])) {
            current_text += string_char_at(text_content[0], char_index_1 + 1);
            char_index_1 += 1;
        }
        else if (line_index == 1 && char_index_2 < string_length(text_content[1])) {
            current_text += string_char_at(text_content[1], char_index_2 + 1);
            char_index_2 += 1;
        }
        else if (line_index == 2 && char_index_3 < string_length(text_content[2])) {
            current_text += string_char_at(text_content[2], char_index_3 + 1);
            char_index_3 += 1;
        }

        // If one line is fully typed, move to the next line
        if ((line_index == 0 && char_index_1 == string_length(text_content[0])) || 
            (line_index == 1 && char_index_2 == string_length(text_content[1])) || 
            (line_index == 2 && char_index_3 == string_length(text_content[2]))) {
            
            line_index += 1;
            
            // Reset current text for the next line
            if (line_index == 1) {
                current_text = "";
            }
            else if (line_index == 2) {
                current_text = "";
            }
        }

        // If all lines are typed, set typing_complete to true to stop further typing
        if (line_index > 2) {
            typing_complete = true;
        }
    }
}

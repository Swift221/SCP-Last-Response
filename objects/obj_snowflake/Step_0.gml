// Update snowflake position
y += vspeed;   // Move the snowflake downward

// Optional: Apply horizontal drift
x += hspeed;

// If the snowflake goes off the bottom of the screen, reset it to the top
if (y > room_height) {
    y = -sprite_height;   // Reset to top of the screen (just above the visible area)
    x = random(room_width);  // Randomize x position again for a new snowflake
}

// Apply the size variation (scale it by 'size' factor)
image_xscale = size;
image_yscale = size;
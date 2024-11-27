x = random(640);

vspeed = random_range(1, 4);

size = random_range(0.5, 1);

// Ensure snowflakes don’t spawn inside the textbox area (x = 100, y = 200, width = 400, height = 120)
while (x >= 100 && x <= 500 && y >= 200 && y <= 320) {
    // If the snowflake spawns inside the textbox area, reset its position
    x = random(room_width);
    y = random_range(-room_height, -50);  // Corrected: random_range(min, max)
}

// Randomize vertical speed (falling speed)
vspeed = random_range(1, 4);  // Snowflakes will fall at speeds between 1 and 4
// Randomize vertical speed (falling speed)
vspeed = random_range(1, 4);  // Snowflakes will fall at speeds between 1 and 4

// Optional: randomize the size of the snowflake for variety
size = random_range(0.5, 1);  // Snowflakes can have a size between 0.5x and 1x

// Optional: randomize horizontal drift speed for variation
hspeed = random_range(-0.5, 0.5);  // Slight horizontal drift

// Spawn a snowflake every frame or based on a timer
if (random(1) < 0.1) {  // Adjust this value to control snowflake density
    instance_create_layer(random(room_width), -10, "Snowflakes", obj_snowflake);
}

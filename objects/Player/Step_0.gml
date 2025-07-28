// Input
var h_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var v_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalize diagonal movement
var length = sqrt(h_input * h_input + v_input * v_input);
if (length > 0) {
    h_input /= length;
    v_input /= length;

    // Set facing direction based on inputs
    if (abs(h_input) > abs(v_input)) {
        facing = h_input > 0 ? "right" : "left";
    } else {
        facing = v_input > 0 ? "down" : "up";
    }
}

// Movement with collision
move_and_collide(h_input * move_speed, v_input * move_speed, Object2, 4, 0, 0, move_speed, move_speed);

// Animation switching
if (h_input == 0 && v_input == 0) {
    switch (facing) {
        case "up": sprite_index = Aaron_Idle_Up; break;
        case "down": sprite_index = Aaron_Idle_down; break;
        case "left": sprite_index = Aaron_idle_left; break;
        case "right": sprite_index = Aaron_Idle_Right; break;
    }
    image_speed = 0.2;
} else {
    switch (facing) {
        case "up": sprite_index = Aaron_Moving_Up; break;
        case "down": sprite_index = Aaron_moving_down; break;
        case "left": sprite_index = Aaron_moving_left; break;
        case "right": sprite_index = Aaron_Moving_Right; break;
    }
    image_speed = 0.2;
}

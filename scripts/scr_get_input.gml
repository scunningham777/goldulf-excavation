/// scr_get_input
dir_up = keyboard_check(vk_up);
dir_right = keyboard_check(vk_right);
dir_down = keyboard_check(vk_down);
dir_left = keyboard_check(vk_left);
dash_key = keyboard_check_pressed(ord('C'));
attack_key = keyboard_check_pressed(ord('X'));

// Get the axis
xaxis = (dir_right - dir_left);
yaxis = (dir_down - dir_up);

// Check for gamepad input
if (gamepad_is_connected(0)) {
    gamepad_set_axis_deadzone(0, .35);
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    dash_key = gamepad_button_check_pressed(0, gp_face2);
    attack_key = gamepad_button_check_pressed(0, gp_face1);
}

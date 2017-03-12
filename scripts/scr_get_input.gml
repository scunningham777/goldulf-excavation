/// scr_get_input
up_key = keyboard_check(vk_up);
right_key = keyboard_check(vk_right);
down_key = keyboard_check(vk_down);
left_key = keyboard_check(vk_left);
dash_key = keyboard_check_pressed(ord('C'));
attack_key = keyboard_check_pressed(ord('X'));
pause_key = keyboard_check_pressed(ord('P'));

// Get the axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

// Check for gamepad input
if (gamepad_is_connected(0)) {
    gamepad_set_axis_deadzone(0, .35);
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    dash_key = gamepad_button_check_pressed(0, gp_face2);
    attack_key = gamepad_button_check_pressed(0, gp_face1);
    pause_key = gamepad_button_check_pressed(0, gp_start);
}

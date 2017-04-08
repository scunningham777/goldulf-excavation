///scr_turn_to_face_action(target_face)
var target_face = argument[0];

if (!is_action_inited) {
//calculate duration based on speed, terrain type, and how far we are turning
//set alarm
    alarm[0] = room_speed / 4;

    is_action_inited = true;
}

//some kind of indicator that they hero is turning?

if (alarm[0] = -1) {
    face = target_face;
    scr_action_completed();
}

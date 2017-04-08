///scr_cannot_move_state()

//set duration (shorter than moving)
var duration = room_speed / 4;

//init the action
if (!is_action_inited) {
    alarm[0] = duration;
    
    //start animation?
    image_speed = walk_anim_speed;
    
    //snap location to grid
    scr_snap_location_to_grid();
    
    is_action_inited = true;
}
    
//get "speed" from face
var h_spd = 0;
var v_spd = 0;

if (face == RIGHT ) { 
    h_spd = 1;
} else if (face == DOWN) {
    v_spd = 1;
} else if (face == LEFT) {
    h_spd = -1
} else if (face == UP) {
    v_spd = -1
}

//for middle 80% of duration, move forward slightly and then move back
var progress = alarm[0] / duration;
if ((progress < .95) && (progress > .5)) {
    x += (CELL_WIDTH / (duration * .9)) * h_spd / 2;
    y += (CELL_HEIGHT / (duration * .9)) * v_spd / 2;
} else if ((progress <= .5) && (progress > .05)) {
    x -= (CELL_WIDTH / (duration * .9)) * h_spd / 2;
    y -= (CELL_HEIGHT / (duration * .9)) * v_spd / 2;
}

//check for alarm end
if (alarm[0] = -1) {
    //set target cell coords back to current coords
    target_cell_x = cell_x;
    target_cell_y = cell_y;
    
    //snap coords to grid
    scr_snap_location_to_grid();
    
    //complete action
    scr_action_completed();
}

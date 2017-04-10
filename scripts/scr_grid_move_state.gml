///scr_grid_move_state

//determine duration based on speed and terrain
var duration = room_speed / 2;

if (!is_action_inited) {
    target_cell_x = cell_x;
    target_cell_y = cell_y;
    switch(face) {
        case RIGHT:
            target_cell_x += 1;
            break;
        case DOWN:
            target_cell_y += 1;
            break;
        case LEFT:
            target_cell_x -= 1;
            break;
        case UP:
            target_cell_y -= 1;
            break;
    }        
    
    //check for collisions and switch to "cannot_move_state" if there is one
    if (scr_grid_place_meeting(target_cell_x, target_cell_y)) {
        cur_action = scr_cannot_move_state;
        exit;
    }   
    
    alarm[0] = duration;
    
    image_speed = walk_anim_speed;
    scr_snap_location_to_grid();
    
    is_action_inited = true;
}

//figure out where we are moving toward
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

//move enough each frame to reach destination by 80% of duration, for slight pause between steps
if (alarm[0] / duration < .95 && alarm[0] / duration > .05) {
    x += (CELL_WIDTH / (duration * .9)) * h_spd;
    y += (CELL_HEIGHT / (duration * .9)) * v_spd;
}

//update cell coord
cell_x = floor(x / CELL_WIDTH);
cell_y = floor(y / CELL_HEIGHT);
    
if (alarm[0] = -1) {
// snap precise location to the grid
    scr_snap_location_to_grid();
    scr_action_completed();
}


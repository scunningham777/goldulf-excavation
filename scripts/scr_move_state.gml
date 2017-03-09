    ///scr_move_state
scr_get_input();

// Get direction
dir = point_direction(0, 0, xaxis, yaxis);

if (xaxis == 0 && yaxis == 0) {
    //Not moving
    len = 0;
    image_speed = 0;
    image_index = 1;
} else {
    //Moving
    len = spd;
    
    //control sprite
    image_speed = walk_anim_speed;
    scr_get_face();
    switch(face) {
        case RIGHT:
            sprite_index = spr_toga_walk_right;
            break;
        case LEFT:
            sprite_index = spr_toga_walk_left;
            break;
        case DOWN:
            sprite_index = spr_toga_walk_down;
            break;
        case UP:
            sprite_index = spr_toga_walk_up;
            break;
    }  
}

// Get hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move
phy_position_x += hspd;
phy_position_y += vspd;

// Handle dash
if (dash_key && obj_player_stats.stamina >= DASH_COST) {
    state = scr_dash_state;
    alarm[0] = room_speed / 6;
    obj_player_stats.stamina -= DASH_COST;
    obj_player_stats.alarm[0] = room_speed;
}

// Handle attack
if (attack_key) {
    image_index = 0;
    state = scr_attack_state;
}

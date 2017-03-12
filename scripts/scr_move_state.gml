///scr_move_state

// Get direction
dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);

if (obj_input.xaxis == 0 && obj_input.yaxis == 0) {
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
if (obj_input.dash_key ) {
    var xdir = lengthdir_x(8, face * 90);
    var ydir = lengthdir_y(8, face * 90);
    var speaker = instance_place(x + xdir, y + ydir, obj_speaker);
    if (speaker != noone) {
        //Talk to speaker
        scr_talk(speaker);
    } else if (obj_player_stats.stamina >= DASH_COST) {
        state = scr_dash_state;
        alarm[0] = room_speed / 6;
        obj_player_stats.stamina -= DASH_COST;
        obj_player_stats.alarm[0] = room_speed;
    }
}

// Handle attack
if (obj_input.attack_key) {
    image_index = 0;
    state = scr_attack_state;
}

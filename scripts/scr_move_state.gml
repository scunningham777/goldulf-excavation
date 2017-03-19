///scr_move_state

movement = MOVE;

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
    scr_get_face(dir);
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

// Handle "spell"
if (obj_input.spell_key) {
    var p = instance_create(x, y, obj_projectile);
    var xforce = lengthdir_x(20, face*90);
    var yforce = lengthdir_y(20, face*90);
    p.creator = id;
    with (p) {
        physics_apply_impulse(x, y, xforce, yforce);
    }
}

// Handle weapon swap
if (obj_input.swap_key) {
    var nearest_weapon = instance_nearest(x, y, obj_weapon_item_parent);
    if (place_meeting(x, y + 4, nearest_weapon)) {
        scr_swap_weapon(nearest_weapon);
    }
}

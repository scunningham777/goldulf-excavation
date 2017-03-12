///scr_attack_state
image_speed = .3;

switch (sprite_index) {
    case spr_toga_walk_down:
        sprite_index = spr_toga_attack_down;
        break;
        
    case spr_toga_walk_up:
        sprite_index = spr_toga_attack_up;
        break;
        
    case spr_toga_walk_right:
        sprite_index = spr_toga_attack_right;
        break;
        
    case spr_toga_walk_left:
        sprite_index = spr_toga_attack_left;
        break;
}

if (image_index >= 1 && attacked == false) {
    var dam_x = x;
    var dam_y = y;
    switch (sprite_index) {
        case spr_toga_attack_down:
            dam_y += 16;
            break;
            
        case spr_toga_attack_up:
            dam_y -= 8;
            break;
            
        case spr_toga_attack_right:
            dam_x += 8;
            break;
            
        case spr_toga_attack_left:
            dam_x -= 8;
            break;
    }
    var damage = instance_create(dam_x, dam_y, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
    attacked = true;
}

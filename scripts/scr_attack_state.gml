///scr_attack_state

movement = ATTACK;

image_speed = .3;

if (scr_animation_hit_frame(1)) {
    var attack_animation = instance_create(x + weapon_offset['x', face], y + weapon_offset['y', face], obj_weapon_animation);
    attack_animation.dir = face * 90;
    attack_animation.sprite_index = obj_player_stats.weapon_sprite;
    attack_animation.image_angle = (face * 90) + 45;
    if (face == DOWN || face == RIGHT) {
        attack_animation.depth = depth - 1;
    }
}

if (scr_animation_hit_frame(2)) {
    var dam_x = x;
    var dam_y = y;
    switch (face) {
        case DOWN:
            dam_y += 14;
            dam_x -= 8;
            break;
            
        case UP:
            dam_y -= 12;
            dam_x += 8;
            break;
            
        case RIGHT:
            dam_x += 10;
            break;
            
        case LEFT:
            dam_x -= 10;
            break;
    }
    
    audio_play_sound(snd_sword_attack, 8, false);
    var damage = instance_create(dam_x, dam_y, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack + obj_player_stats.weapon.attack;
}

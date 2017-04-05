///scr_tut_attack_state

movement = ATTACK;

image_speed = .3;

if (scr_animation_hit_frame(1)) {
    var anim_x = x + weapon_offset[XAXIS, face];
    var anim_y = y + weapon_offset[YAXIS, face];
    var attack_animation = instance_create(anim_x, anim_y, obj_weapon_animation);
    attack_animation.dir = face * 90;
    attack_animation.sprite_index = obj_hero_stats.weapon_sprite;
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
    damage.damage = obj_hero_stats.attack + obj_hero_stats.weapon.attack;
}

///scr_swap_weapon(new_weapon)
if (instance_exists(obj_player_stats)) {
    with (obj_player_stats) {        
        var new_weapon = argument[0];
        var temp_sprite = weapon_sprite;
        var temp_stats = weapon;
        
        weapon_sprite = new_weapon.sprite_index;
        weapon = new_weapon.weapon_stats;
        
        new_weapon.sprite_index = temp_sprite;
        new_weapon.weapon_stats = temp_stats;
    }
}

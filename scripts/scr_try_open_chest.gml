///scr_try_open_chest(chest)
var chest = argument[0];
with (chest) {
    if (isLocked) {
        //TODO: report to user that the chest is locked, also check for key, etc.
    } else if (instance_exists(obj_hero_stats)) {
        //handle sprite
        if (isOpen) {
            sprite_index = spr_chest_closed;
        } else {
            sprite_index = spr_chest_open;
        }
        isOpen = !isOpen;
        
        //handle loot
        if (!isLooted) {
            obj_hero_stats.gold += value;
            if (is_undefined(obj_hero_stats.loot)) {
                obj_hero_stats.loot[0] = contents;
            } else {
                obj_hero_stats.loot[array_length_1d(obj_hero_stats.loot)] = contents;
            }
            
            var effect = instance_create(x, y, obj_particle_ball);
            with (effect) {
                part_type_colour_mix(spark, c_yellow, c_orange);
            }
            
            isLooted = true;
        }
    }
}

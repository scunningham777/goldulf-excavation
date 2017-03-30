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
            scr_merge_loot_grids(contents, obj_hero_stats.loot);
            
            var effect = instance_create(x, y, obj_particle_ball);
            with (effect) {
                part_type_colour_mix(spark, c_yellow, c_orange);
            }
            var num_loot = contents[# 1, 0];
            var loot_name = g_item_stats[# 1, contents[# 0, 0]];
            var loot_plural = 's';
            if (num_loot == 1) {
                loot_plural = '';
            }

            var loot_message = string(num_loot) + ' ' + loot_name + loot_plural;
            var message_x = x + irandom_range(-8, 8);
            var message_y = y - 10 - irandom(-8);
            var message_obj = instance_create(message_x, message_y, obj_acquisition_message);
            message_obj.message = loot_message;
            message_obj.duration = 1;
            
            isLooted = true;
        }
    }
}

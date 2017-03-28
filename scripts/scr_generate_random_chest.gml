///scr_generate_random_chest
var rand_x, rand_y;
do {
    rand_x = random_range(room_width / 4, room_width / 4 * 3);
    rand_y = random_range(room_height / 4, room_height / 4 * 3);    
} until (!place_meeting(rand_x, rand_y, obj_wall) && !place_meeting(rand_x, rand_y, obj_lifeform_parent) && !place_meeting(rand_x, rand_y, obj_chest))

var chest = instance_create(rand_x, rand_y, obj_chest);

var total_items = ds_grid_height(g_item_stats);
var num_loot = irandom_range(1, 3);
ds_grid_resize(chest.contents, 2, 1);
chest.contents[# 0, 0] = irandom(total_items - 1);
chest.contents[# 1, 0] = num_loot;


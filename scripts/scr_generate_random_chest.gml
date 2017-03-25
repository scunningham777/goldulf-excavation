///scr_generate_random_chest
var rand_x, rand_y, hit_lf, hit_w, hit_c;
do {
    rand_x = random_range(room_width / 4, room_width / 4 * 3);
    rand_y = random_range(room_height / 4, room_height / 4 * 3);    
} until (!place_meeting(rand_x, rand_y, obj_wall) && !place_meeting(rand_x, rand_y, obj_lifeform_parent) && !place_meeting(rand_x, rand_y, obj_chest))

var chest = instance_create(rand_x, rand_y, obj_chest);

var loot;
loot[0] = '3 tin earrings';
loot[1] = '1 bronze earth goddess statue';
loot[2] = '2 silver rings';

chest.value = irandom_range(3, 7);
chest.contents = loot[irandom(2)];

///scr_generate_random_monster(monster_obj_id, min_distance_from_hero)
var monster_obj_id = argument[0];
var min_distance_from_hero = argument[1];

var rand_x, rand_y, 
    distance_from_hero = min_distance_from_hero;
do {
    rand_x = random_range(32, room_width - 32);
    rand_y = random_range(32, room_height - 32); 
    if (instance_exists(obj_hero)) {
        distance_from_hero =  point_distance(rand_x, rand_y, obj_hero.x, obj_hero.y);   
    }
} until (!place_meeting(rand_x, rand_y, obj_wall) && !place_meeting(rand_x, rand_y, obj_lifeform_parent) && !place_meeting(rand_x, rand_y, obj_chest) && !place_meeting(rand_x, rand_y, obj_speaker) && distance_from_hero >= min_distance_from_hero)

var monster = instance_create(rand_x, rand_y, monster_obj_id);

return monster;

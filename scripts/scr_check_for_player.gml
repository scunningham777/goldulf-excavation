///scr_check_for_player
if (instance_exists(obj_hero)) {
    var distance = point_distance(x, y, obj_hero.x, obj_hero.y);
    if (distance < sight) {
        state = scr_enemy_chase_state;
        var dir = point_direction(x, y, obj_hero.x, obj_hero.y);
        xaxis = lengthdir_x(1, dir);
        yaxis = lengthdir_y(1, dir);
    } else {
        scr_enemy_choose_next_state();
    }
} else {
    scr_enemy_choose_next_state();
}

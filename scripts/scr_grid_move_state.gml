///scr_grid_move_state
if (instance_exists(obj_input)) {
    var hspd = spd * obj_input.xaxis;
    var vspd = spd * obj_input.yaxis;
    
    if (!(hspd == 0 && vspd == 0)) {
        dir = point_direction(0, 0, hspd, vspd);
        image_speed = walk_anim_speed;
        scr_get_face(dir);

        scr_grid_move(hspd, vspd);    
    } else {
        image_speed = 0;
        image_index = 1;
    }
}

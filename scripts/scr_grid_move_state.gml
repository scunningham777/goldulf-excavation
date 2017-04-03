///scr_grid_move_state
if (instance_exists(obj_input)) {
    var hspd = spd * obj_input.xaxis;
    var vspd = spd * obj_input.yaxis;
    
    if (!(hspd == 0 && vspd == 0)) {
        scr_grid_move(hspd, vspd);    
    }
}

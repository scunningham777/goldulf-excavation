///scr_hero_idle_state
len = 0;
image_speed = 0;
image_index = 1;

//check if there's a task in the queue
if (!ds_list_empty(action_queue)) {
    cur_action_id = action_queue[| 0];
    ds_list_delete(action_queue, 0);
    cur_action = g_hero_actions[# 1, cur_action_id];
}

//else check if the player is pressing a move key
else if (obj_input.xaxis != 0 || obj_input.yaxis != 0) {
    dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);
    var new_face = scr_get_face(dir)
    
    if (new_face != face) {
        var turn_action;
        switch(new_face) {
            case UP:
                turn_action = 1;        //scr_turn_up
                break;
            case RIGHT:
                turn_action = 2;        //scr_turn_right
                break;
            case DOWN:
                turn_action = 3;        //scr_turn_down
                break;
            case LEFT:
                turn_action = 4;        //scr_turn_left
                break;
        }   
        ds_list_add(action_queue, turn_action);
    }
    ds_list_add(action_queue, 0);      //scr_grid_move_state
}
//else do nothing...

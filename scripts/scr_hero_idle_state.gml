///scr_hero_idle_state
len = 0;
image_speed = 0;
image_index = 1;

//check if there's a task in the queue
if (!ds_queue_empty(action_queue)) {
    cur_action = ds_queue_dequeue(action_queue);
}

//else check if the player is pressing a move key
else if (obj_input.xaxis != 0 || obj_input.yaxis != 0) {
    dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);
    var new_face = scr_get_face(dir)
    
    if (new_face != face) {
        var turn_action;
        switch(new_face) {
            case UP:
                turn_action = scr_turn_up;
                break;
            case RIGHT:
                turn_action = scr_turn_right;
                break;
            case DOWN:
                turn_action = scr_turn_down;
                break;
            case LEFT:
                turn_action = scr_turn_left;
                break;
        }   
        ds_queue_enqueue(action_queue, turn_action);
    }
    ds_queue_enqueue(action_queue, scr_grid_move_state);
}
//else do nothing...

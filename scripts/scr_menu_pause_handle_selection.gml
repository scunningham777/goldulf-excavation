///scr_menu_pause_handle_selection
switch (menu_index) {
    case 0:     //Return
        obj_hero_stats.room_start_action = RETURN;
        room_goto(obj_hero_stats.previous_room);
        instance_destroy();
        break;
    case 1:     //Save
        scr_save_game();
        break;
    case 2:     //Load
        obj_hero_stats.room_start_action = LOAD;
        room_goto(obj_hero_stats.previous_room);
        instance_destroy();
        break;
    case 3:     //Quit
        game_end();
        break;
    default:
}


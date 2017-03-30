///scr_menu_pause_handle_selection
switch (menu_index) {
    case 0:
        obj_hero_stats.room_start_action = RETURN;
        room_goto(obj_hero_stats.previous_room);
        break;
    case 1:
        scr_save_game();
        break;
    case 2:
        obj_hero_stats.room_start_action = LOAD;
        room_goto(obj_hero_stats.previous_room);
        break;
    case 3:
        game_end();
        break;
    default:
}


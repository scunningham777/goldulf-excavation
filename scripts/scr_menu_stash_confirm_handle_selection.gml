///scr_menu_stash_confirm_handle_selection()
switch (menu_index) {
    case 0:
        scr_stash_all_current_loot();
    case 1:
        obj_hero_stats.room_start_action = RETURN;
        room_goto(obj_hero_stats.previous_room);
        break;
}

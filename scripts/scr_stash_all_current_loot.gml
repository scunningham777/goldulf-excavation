///scr_stash_all_current_loot
if (instance_exists(obj_hero_stats) && instance_exists(obj_player_museum)) {
    scr_merge_loot_grids(obj_hero_stats.loot, obj_player_museum.total_collection);
    ds_grid_destroy(obj_hero_stats.loot);
    obj_hero_stats.loot = ds_grid_create(2, 0);
} else {
    //something is majorly borked...
    show_debug_message("Either obj_hero_stats or obj_player_museum don't exist. Restarting...");
    game_restart();
}

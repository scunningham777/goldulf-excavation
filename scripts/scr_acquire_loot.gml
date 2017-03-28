///scr_acquire_loot(loot_grid)
loot_grid = argument[0];

if (instance_exists(obj_hero_stats)) {
    var added_loot_count = ds_grid_height(loot_grid);
    
    for (var i = 0; i < added_loot_count; i++) {
        if (ds_grid_value_exists(obj_hero_stats.loot, 0, 0, 0, ds_grid_height(obj_hero_stats.loot)-1, loot_grid[# 0, i])) {
            var item_row = ds_grid_value_y(obj_hero_stats.loot, 0, 0, 0, ds_grid_height(obj_hero_stats.loot)-1, loot_grid[# 0, i]);
            ds_grid_add(obj_hero_stats.loot, 1, item_row, loot_grid[# 1, i]);
        } else {
            ds_grid_resize(obj_hero_stats.loot, ds_grid_width(obj_hero_stats.loot), ds_grid_height(obj_hero_stats.loot)+1);
            obj_hero_stats.loot[# 0, ds_grid_height(obj_hero_stats.loot)-1] = loot_grid[# 0, i];
            obj_hero_stats.loot[# 1, ds_grid_height(obj_hero_stats.loot)-1] = loot_grid[# 1, i];
        }
    }
}

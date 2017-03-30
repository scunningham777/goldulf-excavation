///scr_merge_loot_grids(scr_loot_grid, dest_loot_grid)
var src_loot_grid = argument[0];
var dest_loot_grid = argument[1];
    
for (var i = 0; i < ds_grid_height(src_loot_grid); i++) {
    if (ds_grid_value_exists(dest_loot_grid, 0, 0, 0, ds_grid_height(dest_loot_grid)-1, src_loot_grid[# 0, i])) {
        var item_row = ds_grid_value_y(dest_loot_grid, 0, 0, 0, ds_grid_height(dest_loot_grid)-1, src_loot_grid[# 0, i]);
        ds_grid_add(dest_loot_grid, 1, item_row, src_loot_grid[# 1, i]);
    } else {
        ds_grid_resize(dest_loot_grid, ds_grid_width(dest_loot_grid), ds_grid_height(dest_loot_grid)+1);
        dest_loot_grid[# 0, ds_grid_height(dest_loot_grid)-1] = src_loot_grid[# 0, i];
        dest_loot_grid[# 1, ds_grid_height(dest_loot_grid)-1] = src_loot_grid[# 1, i];
    }
}



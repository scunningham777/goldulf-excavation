///scr_init_item_stats

//item stats structure: 0: id | 1: name | 2: value
globalvar g_item_stats;
g_item_stats = ds_grid_create(3, 3);

ds_grid_add(g_item_stats, 0, 0, 0);
ds_grid_add(g_item_stats, 1, 0, 'tin earring');
ds_grid_add(g_item_stats, 2, 0, 1);

ds_grid_add(g_item_stats, 0, 1, 1);
ds_grid_add(g_item_stats, 1, 1, 'earth goddess statue');
ds_grid_add(g_item_stats, 2, 1, 2);

ds_grid_add(g_item_stats, 0, 2, 2);
ds_grid_add(g_item_stats, 1, 2, 'silver ring');
ds_grid_add(g_item_stats, 2, 2, 3);


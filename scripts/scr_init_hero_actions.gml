///scr_init_hero_actions

//hero actions structure: 0: user friendly name | 1: script
globalvar g_hero_actions;
g_hero_actions = ds_grid_create(2, 5);

ds_grid_add(g_hero_actions, 0, 0, 'Move 1 Pace');
ds_grid_add(g_hero_actions, 1, 0, scr_grid_move_state);

ds_grid_add(g_hero_actions, 0, 1, 'Turn Northward');
ds_grid_add(g_hero_actions, 1, 1, scr_turn_up);

ds_grid_add(g_hero_actions, 0, 2, 'Turn Eastward');
ds_grid_add(g_hero_actions, 1, 2, scr_turn_right);

ds_grid_add(g_hero_actions, 0, 3, 'Turn Southward');
ds_grid_add(g_hero_actions, 1, 3, scr_turn_down);

ds_grid_add(g_hero_actions, 0, 4, 'Turn Westward');
ds_grid_add(g_hero_actions, 1, 4, scr_turn_left);


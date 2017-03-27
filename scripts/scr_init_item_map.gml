///scr_init_item_map
globalvar item_map;
item_map = ds_map_create();
var item_1 = ds_map_create();
var item_2 = ds_map_create();
var item_3 = ds_map_create();

ds_map_add(item_1, 'value', 1);
ds_map_add(item_1, 'name', 'tin earring');

ds_map_add(item_2, 'value', 2);
ds_map_add(item_2, 'name', 'earth goddess statue');

ds_map_add(item_3, 'value', 3);
ds_map_add(item_3, 'name', 'silver ring');

ds_map_add_map(item_map, 0, item_1);
ds_map_add_map(item_map, 1, item_2);
ds_map_add_map(item_map, 2, item_3);

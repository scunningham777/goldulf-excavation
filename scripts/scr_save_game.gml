///scr_save_game()

//make sure player exists
if (!instance_exists(obj_player_stats)) {
    exit;
}

//create save data structure
var save_data = ds_map_create();

with (obj_player_stats) {
    save_data[? "room"] = previous_room;
    save_data[? "x"] = player_xstart;
    save_data[? "y"] = player_ystart;
    save_data[? "hp"] = hp;
    save_data[? "max_hp"] = max_hp;
    save_data[? "stamina"] = stamina;
    save_data[? "max_stamina"] = max_stamina;
    save_data[? "expr"] = expr;
    save_data[? "expr_to_next"] = expr_to_next;
    save_data[? "level"] = level;
    save_data[? "attack"] = attack;
}

var save_string = json_encode(save_data);
ds_map_destroy(save_data);
save_string = base64_encode(save_string);

var file = file_text_open_write(working_directory + "goldulf_save.txt");
file_text_write_string(file, save_string);
file_text_close(file);

show_message("Game saved!");

///scr_switch_to_pause_menu(menu_obj)
var menu_obj = argument[0];

if (instance_exists(obj_hero_stats)) {
    with (obj_hero_stats) {
        // hide the hero
        if (instance_exists(obj_hero)) {
            obj_hero.persistent = false;
        }
        
        // stash previous room & screenshot it    
        previous_room = room;
        room_persistent = true;
        var width = surface_get_width(application_surface);
        var height = surface_get_height(application_surface);
        pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, width, height, false, false, 0, 0);

        // add the designated menu object to the menu room
        globalvar g_menu_obj;
        g_menu_obj = instance_create(0, 0, menu_obj);
        g_menu_obj.persistent = true;
//        room_instance_add(rm_pause, 0, 0, menu_obj);
                
        // Show pause menu
        room_goto(rm_pause);
    }
}


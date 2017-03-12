///scr_talk(obj_speaker)
var speaker = argument[0];
if (object_is_ancestor(speaker.object_index, obj_speaker)) {
    with (speaker) {
        if (!instance_exists(dialog)) {
            dialog = instance_create(x + xoffset, y + yoffset, obj_dialog);
            dialog.text = text;
        } else if (dialog.text_count < string_length(dialog.text[dialog.text_page])) {
            dialog.text_count = string_length(dialog.text[dialog.text_page]);
        } else {
            dialog.text_page++;
            dialog.text_count = 0;
            if (dialog.text_page > array_length_1d(dialog.text) - 1) {
                with (dialog) {
                    instance_destroy();
                }
            }
        }
    }
}

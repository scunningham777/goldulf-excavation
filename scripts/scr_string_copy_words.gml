///scr_string_copy_words(string, index, count)
var str = argument[0];
var index = argument[1];
var count = ceil(argument[2]);

var char = string_char_at(str, count);
while (char != " " && char != "") {
    count++;
    char = string_char_at(str, count);
}

var return_str = string_copy(str, index, count);
return return_str;

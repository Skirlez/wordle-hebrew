/// @description Use it please
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var t = "Press SPACE to see your clipboard content\nPress Enter to copy something random to it.";

draw_text(room_width/2,room_height/2,t + "\nClipboard Content : "+clip_text);
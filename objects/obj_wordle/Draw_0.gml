draw_set_color(c_white)
draw_set_font(narkistam)
draw_text(50, 50, rv(chosenword))
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(320, 180, rv(typingword))


if string_length(typingword) < 5 and ord(keyboard_lastchar) >= 1488 and ord(keyboard_lastchar) <= 1514 {
	typingword += keyboard_lastchar
	keyboard_lastchar = ""
}

if string_length(typingword) > 0 and keyboard_check_pressed(vk_backspace)
	typingword = string_delete(typingword, string_length(typingword), 1);




if keyboard_check_pressed(vk_enter) {
	isinlist = checkword(typingword)
	displaytimer = 100	
}
	
	
if displaytimer > 0 {
	displaytimer -= 1
	if isinlist == true
		draw_text(200, 50, rv("כן"))	
	else
		draw_text(200, 50, rv("לא"))	
}
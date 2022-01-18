draw_set_color(c_white)
draw_set_font(narkistam)
draw_text(50, 50, rv(chosenword))
draw_set_halign(fa_center)
draw_set_valign(fa_middle)


if array_length(typingword) <= 5 and ord(keyboard_lastchar) >= 1488 and ord(keyboard_lastchar) <= 1514 {
	array_insert(typingword, array_length(typingword), keyboard_lastchar)
	keyboard_lastchar = ""
}

if array_length(typingword) > 0 and keyboard_check_pressed(vk_backspace)
	array_delete(typingword, array_length(typingword) - 1, 1)

for (var i = 0; i < array_length(typingword); i++)
	typingwordstring += typingword[i]


draw_text(320, 180, rv(typingwordstring))

if keyboard_check_pressed(vk_enter) {
	isinlist = checkword(typingwordstring)
	displaytimer = 100	
}
	
	
if displaytimer > 0 {
	displaytimer -= 1
	if isinlist == true
		draw_text(200, 50, rv("כן"))	
	else
		draw_text(200, 50, rv("לא"))	
}

typingwordstring = ""
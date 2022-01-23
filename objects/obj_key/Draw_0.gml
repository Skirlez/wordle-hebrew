draw_self()
draw_set_font(narkistamSmall)

if global.updatekeyboard == true {
	var letteratwords = string_last_pos(text, global.words)
	if letteratwords != 0 {
		var result = string_char_at(global.guesses, letteratwords)
		if result != "" {
			result = int64(result)
			if result > status
				status = result
		}
	}

}

if global.keyboardmode == 2 
	image_index = 1
else
	image_index = status

switch (special) {
	case 0:
		if global.keyboardmode == 0 or global.keyboardmode == 2
			draw_text_transformed(x, y + 8, text, 1, 1, 0)
		else if global.keyboardmode == 1
			draw_text_transformed(x, y + 8, converttoend(text), 1, 1, 0)
		break;
	case 1:
	case 2:
		draw_text_transformed(x, y + 8, rv(text), 1, 1, 0)
		break;
	
}
draw_set_color(c_white)
draw_set_font(narkistam)
//draw_text(50, 50, rv(chosenword))
draw_set_halign(fa_center)
draw_set_valign(fa_middle)


if array_length(typingword) < 5 and ord(keyboard_lastchar) >= 1488 and ord(keyboard_lastchar) <= 1514 {
	array_insert(typingword, array_length(typingword), keyboard_lastchar)
	keyboard_lastchar = ""
}

if array_length(typingword) > 0 and keyboard_check_pressed(vk_backspace) {
	array_delete(typingword, array_length(typingword) - 1, 1)
}

for (var i = 0; i < array_length(typingword); i++)
	typingwordstring += typingword[i]


var i = 0
var m = 6 - attempts
repeat(6 - m) {
	repeat(5) {
		if reveal == i and m == 6 - attempts {
			
			if squareyscale == -0.9 {
				j = instance_create_depth(372 - i * 26, 90 + m * 27, depth + 1, obj_dummy)
				j.image_index = guesswordcorrect[i]
				j.text = typingword[i]
			}
			
			
			if squareyscale > 0
				imgindex = 0
			else
				imgindex = guesswordcorrect[i]
			
			draw_sprite_ext(spr_square, imgindex, 372 - i * 26, 90 + m * 27, 1, squareyscale, 0, c_white, 1)
		}
		else if (m == 6 - attempts and i > reveal) or m != 6 - attempts
			draw_sprite(spr_square, 0, 372 - i * 26, 90 + m * 27)	
			
		if i < array_length(typingword) and m == 6 - attempts {
			if reveal == i
				draw_text_transformed(372 - i * 26, 101 + m * 27 + (abs(squareyscale) - 1) * 11, typingword[i], 1, abs(squareyscale), 0)
			else
				draw_text(372 - i * 26, 101 + m * 27, typingword[i])
		}
		i += 1
	}
		
	m += 1
	i = 0
}


if reveal != -1 {
	squareyscale -= 0.1	
	if squareyscale == -1 {
		squareyscale = 1
		reveal += 1
		if reveal == 6 {
			reveal = -1
			canguess = true
			attempts -= 1
			typingword = []
		}
	}

}


if keyboard_check_pressed(vk_enter) and canguess == true {
	if string_length(typingwordstring) == 5 {
		isinlist = checkword(typingwordstring)
		if isinlist == true {
			var i = 0
			repeat (5) {
				if string_count(typingword[i], chosenword) == 0
					guesswordcorrect[i] = 1
				else if typingword[i] == string_char_at(chosenword, i + 1)
					guesswordcorrect[i] = 3
				else
					guesswordcorrect[i] = 2
			
				i += 1
			}
		
			reveal = 0
			canguess = false
		}
		else {
			textpopup = "זאת אינו מילה"
			displaytimer = 150
		}
	}
	else {
		textpopup = "המילה חייבת להיות באורך חמישה אותיות"
		displaytimer = 150
	}
}
	
	
if displaytimer > 0 {
	draw_set_font(narkistamSmall)
	displaytimer -= 1
		draw_text(320, 60, rv(textpopup))	

}

typingwordstring = ""
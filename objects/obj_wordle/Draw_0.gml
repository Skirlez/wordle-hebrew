draw_set_color(c_white)
draw_set_font(narkistam)
//draw_text(50, 50, rv(chosenword))
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(320, 25, rv("מלילית"))


	
keyboardchar = keyboard_lastchar
	
if mouse_check_button_pressed(mb_left) {
	var key = instance_position(mouse_x, mouse_y, obj_key)
	if key != noone {
		switch key.special {
			case 0:
				keyboardchar = key.text
				break;
				
			case 1:
				keyboard_key_press(vk_enter)
				keyboard_key_release(vk_enter)
				break;
			
			case 2:
				keyboard_key_press(vk_backspace)
				keyboard_key_release(vk_backspace)
				break;
				
			case 3:
				global.showWindow = true
				obj_text.show = true
				break;
			case 4:
				global.showWindow = true
				break;
				
			
			
		}
	}
	
}	

if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, obj_close) {
	global.showWindow = false
	obj_text.show = false
}

if canguess == false or endgame == true {
	keyboard_lastchar = ""	
	keyboardchar = ""
}

if array_length(typingword) < 5 and ord(keyboardchar) >= 1488 and ord(keyboardchar) <= 1514 {
	array_insert(typingword, array_length(typingword), converttobegin(keyboardchar))
	keyboard_lastchar = ""

}


if array_length(typingword) > 0 and keyboard_check_pressed(vk_backspace) and canguess == true {
	array_delete(typingword, array_length(typingword) - 1, 1)
}

var arrlength = array_length(typingword)
if arrlength >= 4
	global.keyboardmode = 1
else
	global.keyboardmode = 0

if canguess = false
	global.keyboardmode = 0

for (var i = 0; i < array_length(typingword); i++)
	typingwordstring += typingword[i]


var i = 0
var m = 6 - attempts
repeat(6 - m) {
	repeat(5) {
		if (reveal == i) and m == 6 - attempts {
			
			if squareyscale == -0.9 {
				
				j = instance_create_depth(372 - i * 26, 90 + m * 27, depth + 1, obj_dummy)
				j.image_index = guesswordcorrect[i]
				if i == 4
					j.text = converttoend(typingword[i])
				else
					j.text = typingword[i]
				
				
					
			}
			
			
			if squareyscale > 0
				imgindex = 0
			else {
				if imgindex == 0
					global.words += typingword[i]
				imgindex = guesswordcorrect[i]
			}
			
			draw_sprite_ext(spr_square, imgindex, 372 - i * 26, 90 + m * 27, 1, squareyscale, 0, c_white, 1)
		}
		else if (m == 6 - attempts and i > reveal) or m != 6 - attempts
			draw_sprite(spr_square, 0, 372 - i * 26, 90 + m * 27)	
			
		if i < array_length(typingword) and m == 6 - attempts {
			letter = typingword[i]
			if i == 4
				letter = converttoend(letter)
			
			if (reveal == i)
				draw_text_transformed(372 - i * 26, 102 + m * 27 + (abs(squareyscale) - 1) * 12, letter, 1, abs(squareyscale), 0)
			else
				draw_text_transformed(372 - i * 26, 102 + m * 27, letter, 1, 1, 0)
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
		if reveal == 5 {
			reveal = -1
			typingword = []
			attempts -= 1
			global.updatekeyboard = false
			// you could probably not do it like this but I am tired
			if guess_string == "33333" 
				endgame = true	
			else if attempts != 0 {
				canguess = true
			}
			else
				endgame = true	
			
		}
	}

}


if keyboard_check_pressed(vk_enter) and canguess == true {
	if string_length(typingwordstring) == 5 {
		isinlist = checkword(typingwordstring)
		if isinlist == true {
			global.updatekeyboard = true
			var i = 0
			guess_string = ""
			
			repeat (5) {
				lettercount = string_count(typingword[i], chosenword)
				
				if lettercount == 0
					guesswordcorrect[i] = 1
				else if typingword[i] == string_char_at(chosenword, i + 1)
					guesswordcorrect[i] = 3
				else {
					if lettercount >= 1
						guesswordcorrect[i] = 2
					else
						guesswordcorrect[i] = 1

				}
			
				guess_string += string(guesswordcorrect[i])
				i += 1
			}
			
			
			global.guesses += guess_string
			ini_open("board");
			var currentwords = ini_read_string("board", "words", "")
			var currentguesses = ini_read_string("board", "guesses", "")
			ini_write_string("board", "words", currentwords + typingwordstring)
			ini_write_string("board", "guesses", currentguesses + guess_string)
			
			if guess_string == "33333" {
				var currentwins = ini_read_real("meta", "wins", 0)
				ini_write_real("meta", "wins", currentwins + 1)
			}
			
			ini_close()
		
			reveal = 0
			canguess = false
			var i = 0


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

function rv(str) { 
		var len = string_length(str)
		var newstr = ""
		for (var i = 0; i < len; i++) 
			newstr += string_char_at(str, len - i)
		
		return newstr

}
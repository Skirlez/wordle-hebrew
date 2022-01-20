// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function converttobegin(letter) {
	switch letter {
		case "ך":
			return "כ"
		case "ם":
			return "מ"
		case "ן":
			return "נ"
		case "ף":
			return "פ"
		case "ץ":
			return "צ"
		default:
			return letter
	}


}
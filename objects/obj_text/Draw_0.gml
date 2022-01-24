draw_self()
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x, y - 80, rv("ניצחת!"))

if global.showWindow == true and show == true {
	if unfortunate < 1 {
		unfortunate += 0.015
		y = animcurve_channel_evaluate(realcurve, unfortunate) * 320 - 180
	}
}
else {
	if unfortunate > 0 {
		unfortunate -= 0.015
		if unfortunate > 0.5
			unfortunate = 0.5
		y = animcurve_channel_evaluate(realcurve, unfortunate) * 320 - 180
	}	
}
obj_close.x = x + 96
obj_close.y = y - 80
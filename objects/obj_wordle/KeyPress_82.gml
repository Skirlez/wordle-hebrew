var wordbank = choose(0, 1)
if wordbank == 0 {
	var num = irandom_range(0, ds_list_size(words))
	chosenword = words[| num]
}
else {
	var num = irandom_range(0, ds_list_size(words2))
	chosenword = words2[| num]
}

function checkword(word) {
	if ds_list_find_index(words, word) != -1 or ds_list_find_index(words2, word) != -1
		return true;
	else
		return false;
}
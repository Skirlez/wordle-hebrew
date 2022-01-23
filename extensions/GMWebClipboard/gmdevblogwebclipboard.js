function web_clipboard_set(text) {
    var dummy = document.createElement("textarea");
    // to avoid breaking orgain page when copying more words
    // cant copy when adding below this code
    // dummy.style.display = 'none'
    document.body.appendChild(dummy);
    //Be careful if you use texarea. setAttribute('value', value), which works with "input" does not work with "textarea". – Eduard
    dummy.value = text;
    dummy.select();
    document.execCommand("copy");
    document.body.removeChild(dummy);
}

function web_clipboard_get(successCallbackFunction,failedcallbackFunction) {
navigator.clipboard.readText()
  .then(text => {
  	if (successCallbackFunction!="")
  	{
  	console.log("Clipboard content : " + text);
    eval("gml_Script_"+successCallbackFunction+"(null,null,'"+text+"')");
	}
  })
  .catch(err => {
  	console.log("Clipboard content fails : " + err);
  	if (failedcallbackFunction!=""){
    eval("gml_Script_"+successCallbackFunction+"(null,null,'"+err+"')");
	}
  });
}
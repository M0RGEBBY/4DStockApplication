Class constructor($method : Text; $headers : Object; $body : Text)
	This.method:=$method
	This.headers:=$headers
	This.body:=$body
	
Function onResponse($request : 4D.HTTPRequest; $event : Object)
	//My onResponse method, if you want to handle the request asynchronously
	
Function onError($request : 4D.HTTPRequest; $event : Object)
	//My onError method, if you want to handle the request asynchronously
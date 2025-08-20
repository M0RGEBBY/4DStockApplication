Class constructor($method : Text; $headers : Object; $body : Text)
	This:C1470.method:=$method
	This:C1470.headers:=$headers
	This:C1470.body:=$body
	
Function onResponse($request : 4D:C1709.HTTPRequest; $event : Object)
	//My onResponse method, if you want to handle the request asynchronously
	
Function onError($request : 4D:C1709.HTTPRequest; $event : Object)
	//My onError method, if you want to handle the request asynchronously
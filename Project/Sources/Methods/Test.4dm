//%attributes = {}
var $methods : Collection
var $method : Object

$methods:=Get project methods
For each ($method; $methods)
	METHOD SET CODE:C1194($method.name; METHOD GET CODE:C1190($method.name))
End for each 
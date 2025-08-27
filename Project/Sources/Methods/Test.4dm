//%attributes = {}
// REMOVE_4D_TOKENS — Re-save all code to exclude TOKENS. Note: The DB's Project file must have been modified to save without tokens
ARRAY TEXT:C222($allPaths; 0)
METHOD GET PATHS:C1163(Path all objects:K72:16; $allPaths)
var $colPaths : Collection:=[]
ARRAY TO COLLECTION:C1563($colPaths; $allPaths)
var $path : Text
var $code : Text
For each ($path; $colPaths)
	METHOD GET CODE:C1190($path; $code; 0)
	METHOD SET CODE:C1194($path; $code)
End for each 
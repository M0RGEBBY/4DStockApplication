//%attributes = {"lang":"en"}
// REMOVE_4D_TOKENS — Re-save all code to exclude TOKENS. Note: The DB's Project file must have been modified to save without tokens
ARRAY TEXT($allPaths; 0)
METHOD GET PATHS(Path all objects; $allPaths)
var $colPaths : Collection:=[]
ARRAY TO COLLECTION($colPaths; $allPaths)
var $path : Text
var $code : Text
For each ($path; $colPaths)
	METHOD GET CODE($path; $code; 0)
	METHOD SET CODE($path; $code)
End for each 
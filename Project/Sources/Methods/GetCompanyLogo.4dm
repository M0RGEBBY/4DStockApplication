//%attributes = {"lang":"en"}
C_TEXT($ticker; $waName)

$ticker:=String($1)
$waName:=String($2)

//Calls the LogoKit API to populate the image of the currently selected stock
$html:="<html><body style='margin:0; padding:0;'><img src='https://img.logokit.com/ticker/"+$ticker+"?token=pk_fr0e773c2db97bf78d624c' style='width:100%; height:100%; display:block;'></body></html>"

//Creates temporary file path to store currentStockTicker image
$filePath:=String(Temporary folder)+"currentStockTicker.html"

//Creates document at file path
TEXT TO DOCUMENT($filePath; $html)

//Sets the logo field
WA OPEN URL(*; $waName; $filePath)
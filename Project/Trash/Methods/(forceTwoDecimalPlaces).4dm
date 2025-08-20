//%attributes = {}
var $price : Real
var $priceStr : Text

$price:=Round:C94($request.response.body.c; 2)  // round to 2 decimals

// Convert number to text with max 2 decimals
$priceStr:=String:C10($price)

// Check if decimal point exists
If (FindChar($priceStr; ".")=0)
	// No decimal point, add ".00"
	$priceStr:=$priceStr+".00"
Else 
	// Has decimal, check how many digits after decimal
	var $decimalsCount : Integer
	$decimalsCount:=Length:C16($priceStr)-PositionOfChar($priceStr; ".")
	
	If ($decimalsCount=1)
		// Only 1 decimal digit, add one zero
		$priceStr:=$priceStr+"0"
	End if 
End if 

Form:C1466.currentPrice:="$"+$priceStr
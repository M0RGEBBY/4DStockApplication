//%attributes = {}
// Description: Takes in a strike price and ticker, calls the finnhub api to grab current price, and then 
// returns the difference between the current price and the strike price (in percentage)

var $finnhubApiKey : Text:="d23pcnpr01qv4g01lod0d23pcnpr01qv4g01lodg"

//Parameters
$ticker:=($1)
$strikePrice:=(Num:C11($2))

//Build api call string
var $finnhubQuoteUrl : Text:="https://finnhub.io/api/v1/quote?symbol="+$ticker+"&token="+$finnhubApiKey

var $finnhubRequest : 4D:C1709.HTTPRequest
$finnhubRequest:=4D:C1709.HTTPRequest.new($finnhubQuoteUrl)
$finnhubRequest.wait()

If ($finnhubRequest.response.status=200)
	$currentPrice:="$"+String:C10(Trunc:C95($finnhubRequest.response.body.c; 2); "##0.00")
End if 


return Num:C11($currentPrice)

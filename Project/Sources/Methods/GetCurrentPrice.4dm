//%attributes = {"lang":"en"}
// Description: Takes in a strike price and ticker, calls the finnhub api to grab current price, and then 
// returns the difference between the current price and the strike price (in percentage)

var $finnhubApiKey : Text:=GetAPIKey("finnhub")

//Parameters
$ticker:=($1)
$strikePrice:=(Num($2))

If ($finnhubApiKey="")
	return Null
End if 

//Build api call string
var $finnhubQuoteUrl : Text:="https://finnhub.io/api/v1/quote?symbol="+$ticker+"&token="+$finnhubApiKey

var $finnhubRequest : 4D.HTTPRequest
$finnhubRequest:=4D.HTTPRequest.new($finnhubQuoteUrl)
$finnhubRequest.wait()

If ($finnhubRequest.response.status=200)
	$currentPrice:="$"+String(Trunc($finnhubRequest.response.body.c; 2); "##0.00")
End if 


return Num($currentPrice)

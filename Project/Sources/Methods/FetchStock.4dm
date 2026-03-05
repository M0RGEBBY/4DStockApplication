//%attributes = {"lang":"en"}
// Prepare API info
var $ticker : Text:="AAPL"
var $apiKey : Text:=GetAPIKey("finnhub")
If ($apiKey="")
	ALERT("Missing Finnhub API key. Add it in Settings.")
	return 
End if 
var $url : Text:="https://finnhub.io/api/v1/quote?symbol="+$ticker+"&token="+$apiKey


// Create the HTTP request
var $request : 4D.HTTPRequest
$request:=4D.HTTPRequest.new($url)

$request.wait()


If ($request.response.status=200)
	
	ALERT("Current price: "+String($request.response.body.c))
	
Else 
	ALERT("Request failed with status: "+String($request.response.status))
End if 

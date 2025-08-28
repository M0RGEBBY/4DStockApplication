//%attributes = {"lang":"en"}
// Prepare API info
var $ticker : Text:="AAPL"
var $apiKey : Text:="d23pcnpr01qv4g01lod0d23pcnpr01qv4g01lodg"
var $url : Text:="https://finnhub.io/api/v1/quote?symbol="+$ticker+"&token="+$apiKey


// Create the HTTP request
var $request : 4D.HTTPRequest
$request:=4D.HTTPRequest.new($url)

$request.wait()


If ($request.response.status=200)
	
	ALERT("Current price: "+String($request.response.body.c))
	
Else 
	ALERT("Request failed with status: "+String($request.statusCode))
End if 
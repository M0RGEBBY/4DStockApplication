//%attributes = {"lang":"en"}
// Declare all variables
var $apiKey : Text:="DcKD2DhLAXL3qgSVXVD9MXTYfA_yrupp"
var $url : Text:="https://api.polygon.io/v3/reference/tickers?market=stocks&type=CS&limit=1000&apiKey="+$apiKey
var $cursor : Text:=""
var $allResults : Collection:=New collection:C1472
var $json : Object
var $results : Collection
var $request : 4D:C1709.HTTPRequest

//Clear existing records in database to avoid duplicates
ds:C1482.Stock.all().drop()

//Repeat until url is set to an empty string
Repeat 
	
	//Send the initial request using the value stored in urk
	$request:=4D:C1709.HTTPRequest.new($url)
	
	//Waits to recieve a response
	$request.wait()
	
	//checks if response was recieved successfully
	If ($request.response.status=200)
		
		//counter variable used to loop through array
		i:=0
		
		//Loop through the results (limited to 1000 at a time)
		For each ($item; $request.response.body.results)
			$stock:=ds:C1482.Stock.new()
			$stock.CompanyName:=$request.response.body.results[i].name
			$stock.Ticker:=($request.response.body.results[i].ticker)
			$stock.Exchange:=($request.response.body.results[i].primary_exchange)
			i:=i+1
			$info:=$stock.save()
			
		End for each 
		If ($request.response.body.next_url#Null:C1517)
			$url:=$request.response.body.next_url+"&apiKey="+$apiKey
		Else 
			$url:=""  // no more pages
		End if 
		// Delay to avoid exceeding rate limit
		DELAY PROCESS:C323(Current process:C322; 720)
	Else 
		ALERT:C41("Request failed with status: "+String:C10($request.response.status))
		break
	End if 
Until ($url="")
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		//=-=-=-=-=-=- Declare Variables -=-=-=-=-=-=- 
		$ticker:=Form:C1466.Ticker
		$companyName:=Form:C1466.CompanyName
		$exchange:=Form:C1466.Exchange
		var $finnhubApiKey : Text:="d23pcnpr01qv4g01lod0d23pcnpr01qv4g01lodg"
		var $finnhubQuoteUrl : Text:="https://finnhub.io/api/v1/quote?symbol="+$ticker+"&token="+$finnhubApiKey
		var $timePeriod : Text:="20"
		LoadTradingViewChart(Form:C1466.Ticker; Form:C1466.Exchange; "WebArea")
		GetCompanyLogo(Form:C1466.Ticker; "logoWebArea")
/*//===== Alpha Vantage API Call (Grabs 20 Day SMA data)
var $alphaApiKey : Text:="207WRRF8H9AWTFA4"
var $alphaQuoteUrl : Text:="https://www.alphavantage.co/query?function=SMA&symbol="+$ticker+"&interval=daily&time_period="+$timePeriod+"&series_type=close&apikey="+$alphaApiKey
var $alphaRequest : 4D.HTTPRequest
		
$alphaRequest:=4D.HTTPRequest.new($alphaquoteURL)
$alphaRequest.wait()
		
If ($alphaRequest.response.status=200)
Form._20DaySMA:=$alphaRequest.response.body["Technical Analysis: SMA"]["2025-08-12"]
Else 
ALERT("Request failed with status: "+String($request.statusCode))
End if 
		
//===== Alpha Vantage API Call (Grabs 50 Day SMA data)
$timePeriod:=String(50)
$alphaQuoteUrl:="https://www.alphavantage.co/query?function=SMA&symbol="+$ticker+"&interval=daily&time_period="+$timePeriod+"&series_type=close&apikey="+$alphaApiKey
		
$alphaRequest:=4D.HTTPRequest.new($alphaquoteURL)
$alphaRequest.wait()
		
If ($alphaRequest.response.status=200)
Form._50DaySMA:=$alphaRequest.response.body["Technical Analysis: SMA"]["2025-08-12"]
Else 
ALERT("Request failed with status: "+String($request.statusCode))
End if 
		
//===== Alpha Vantage API Call (Grabs 200 Day SMA data)
$timePeriod:=String(200)
$alphaQuoteUrl:="https://www.alphavantage.co/query?function=SMA&symbol="+$ticker+"&interval=daily&time_period="+$timePeriod+"&series_type=close&apikey="+$alphaApiKey
		
$alphaRequest:=4D.HTTPRequest.new($alphaquoteURL)
$alphaRequest.wait()
		
If ($alphaRequest.response.status=200)
Form._200DaySMA:=$alphaRequest.response.body["Technical Analysis: SMA"]["2025-08-12"]["SMA"]
ALERT(String(Form._200DaySMA; "##0.00"))
Else 
ALERT("Request failed with status: "+String($request.statusCode))
End if 
		
*/
		
		
		
		//--------------- finnhub API Call (grabs quote information)
		var $finnhubRequest : 4D:C1709.HTTPRequest
		$finnhubRequest:=4D:C1709.HTTPRequest.new($finnhubQuoteUrl)
		$finnhubRequest.wait()
		
		If ($finnhubRequest.response.status=200)
			Form:C1466.currentPrice:="$"+String:C10(Trunc:C95($finnhubRequest.response.body.c; 2); "##0.00")
			Form:C1466.previousClosePrice:="$"+String:C10(Trunc:C95($finnhubRequest.response.body.pc; 2); "##0.00")
			Form:C1466.priceDelta:="$"+String:C10(Trunc:C95($finnhubRequest.response.body.d; 2); "##0.00")
			Form:C1466.pricePercentage:=Trunc:C95($finnhubRequest.response.body.dp; 2)
			Form:C1466.priceStatusString:=String:C10(Form:C1466.priceDelta)+" | "+String:C10(Form:C1466.pricePercentage)+"% Today"
			If ($finnhubRequest.response.body.d<=0)
				OBJECT SET RGB COLORS:C628(*; "changeString"; "red")
			Else 
				OBJECT SET RGB COLORS:C628(*; "changeString"; "green")
			End if 
		Else 
			ALERT:C41("Request failed with status: "+String:C10($request.statusCode))
		End if 
		
		
		
		
		
	: (Form event code:C388=On Close Box:K2:21)
		CANCEL:C270
		
		
End case 


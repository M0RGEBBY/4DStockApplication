Case of 
		
	: (Form event code=On Load)
		//=-=-=-=-=-=- Declare Variables -=-=-=-=-=-=- 
		$ticker:=Form.Ticker
		$companyName:=Form.CompanyName
		$exchange:=Form.Exchange
		var $finnhubApiKey : Text:="d23pcnpr01qv4g01lod0d23pcnpr01qv4g01lodg"
		var $finnhubQuoteUrl : Text:="https://finnhub.io/api/v1/quote?symbol="+$ticker+"&token="+$finnhubApiKey
		var $timePeriod : Text:="20"
		LoadTradingViewChart(Form.Ticker; Form.Exchange; "WebArea")
		GetCompanyLogo(Form.Ticker; "logoWebArea")
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
		var $finnhubRequest : 4D.HTTPRequest
		$finnhubRequest:=4D.HTTPRequest.new($finnhubQuoteUrl)
		$finnhubRequest.wait()
		
		If ($finnhubRequest.response.status=200)
			Form.currentPrice:="$"+String(Trunc($finnhubRequest.response.body.c; 2); "##0.00")
			Form.previousClosePrice:="$"+String(Trunc($finnhubRequest.response.body.pc; 2); "##0.00")
			Form.priceDelta:="$"+String(Trunc($finnhubRequest.response.body.d; 2); "##0.00")
			Form.pricePercentage:=Trunc($finnhubRequest.response.body.dp; 2)
			Form.priceStatusString:=String(Form.priceDelta)+" | "+String(Form.pricePercentage)+"% Today"
			If ($finnhubRequest.response.body.d<=0)
				OBJECT SET RGB COLORS(*; "changeString"; "red")
			Else 
				OBJECT SET RGB COLORS(*; "changeString"; "green")
			End if 
		Else 
			ALERT("Request failed with status: "+String($request.statusCode))
		End if 
		
		
		
		
		
	: (Form event code=On Close Box)
		CANCEL
		
		
End case 


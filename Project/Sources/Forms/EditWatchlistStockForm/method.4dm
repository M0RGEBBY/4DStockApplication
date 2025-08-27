Case of 
		
	: (Form event code:C388=On Load:K2:1)
		//=-=-=-=-=-=- Declare Variables -=-=-=-=-=-=- 
		$ticker:=Form:C1466.WatchlistStock.ticker
		$companyName:=Form:C1466.WatchlistStock.companyName
		$exchange:=Form:C1466.WatchlistStock.exchange
		var $finnhubApiKey : Text:="d23pcnpr01qv4g01lod0d23pcnpr01qv4g01lodg"
		var $finnhubQuoteUrl : Text:="https://finnhub.io/api/v1/quote?symbol="+$ticker+"&token="+$finnhubApiKey
		var $timePeriod : Text:="20"
		LoadTradingViewChart($ticker; $exchange; "WebArea")
		GetCompanyLogo($ticker; "logoWebArea")
		
		
		//Set default values for fields on the form
		Form:C1466.strikePriceText:="$"+String:C10(Form:C1466.WatchlistStock.strikePrice; "#,##0.00")
		
		Form:C1466.stopLossText:="$"+String:C10(Form:C1466.WatchlistStock.stopLossPrice; "#,##0.00")
		Form:C1466.resistanceText:="$"+String:C10(Form:C1466.WatchlistStock.topResistance; "#,##0.00")
		Form:C1466.supportText:="$"+String:C10(Form:C1466.WatchlistStock.botResistance; "#,##0.00")
		//calculate 5% loss from price target
		Form:C1466.fivePercentStop:="$"+String:C10(calculateStopLossTarget(Form:C1466.WatchlistStock.strikePrice; 0.05); "#,##0.00")
		
		//calculate 10% loss from price target
		Form:C1466.tenPercentStop:="$"+String:C10(calculateStopLossTarget(Form:C1466.WatchlistStock.strikePrice; 0.1); "#,##0.00")
		
		//--------------- finnhub API Call (grabs quote information)
		var $finnhubRequest : 4D:C1709.HTTPRequest
		$finnhubRequest:=4D:C1709.HTTPRequest.new($finnhubQuoteUrl)
		$finnhubRequest.wait()
		
		If ($finnhubRequest.response.status=200)
			Form:C1466.currentPrice:="$"+String:C10(Trunc:C95($finnhubRequest.response.body.c; 2); "##0.00")
			Form:C1466.previousClosePrice:="$"+String:C10(Trunc:C95($finnhubRequest.response.body.pc; 2); "##0.00")
			Form:C1466.priceDelta:="$"+String:C10(Trunc:C95($finnhubRequest.response.body.d; 2); "##0.00")
			Form:C1466.pricePercentage:=Trunc:C95($finnhubRequest.response.body.dp; 2)
			Form:C1466.priceStatusString:=String:C10(Form:C1466.priceDelta)+" | "+String:C10(Form:C1466.pricePercentage; "###0.00")+"% Today"
			
			If ($finnhubRequest.response.body.d<=0)
				OBJECT SET RGB COLORS:C628(*; "changeString"; "rgb(255, 0, 0)"; "rgb(255, 200, 200)")
			Else 
				OBJECT SET RGB COLORS:C628(*; "changeString"; "rgb(0,128,0)"; "rgb(220,255,220)")
			End if 
		Else 
			ALERT:C41("Request failed with the status: "+String:C10($request.statusCode))
		End if 
		
		
		
		
		
	: (Form event code:C388=On Close Box:K2:21)
		CANCEL:C270
		
		
End case 


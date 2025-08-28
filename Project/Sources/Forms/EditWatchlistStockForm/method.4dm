Case of 
		
	: (Form event code=On Load)
		//=-=-=-=-=-=- Declare Variables -=-=-=-=-=-=- 
		$ticker:=Form.WatchlistStock.ticker
		$companyName:=Form.WatchlistStock.companyName
		$exchange:=Form.WatchlistStock.exchange
		var $finnhubApiKey : Text:="d23pcnpr01qv4g01lod0d23pcnpr01qv4g01lodg"
		var $finnhubQuoteUrl : Text:="https://finnhub.io/api/v1/quote?symbol="+$ticker+"&token="+$finnhubApiKey
		var $timePeriod : Text:="20"
		LoadTradingViewChart($ticker; $exchange; "WebArea")
		GetCompanyLogo($ticker; "logoWebArea")
		
		
		//Set default values for fields on the form
		Form.strikePriceText:="$"+String(Form.WatchlistStock.strikePrice; "#,##0.00")
		
		Form.stopLossText:="$"+String(Form.WatchlistStock.stopLossPrice; "#,##0.00")
		Form.resistanceText:="$"+String(Form.WatchlistStock.topResistance; "#,##0.00")
		Form.supportText:="$"+String(Form.WatchlistStock.botResistance; "#,##0.00")
		//calculate 5% loss from price target
		Form.fivePercentStop:="$"+String(calculateStopLossTarget(Form.WatchlistStock.strikePrice; 0.05); "#,##0.00")
		
		//calculate 10% loss from price target
		Form.tenPercentStop:="$"+String(calculateStopLossTarget(Form.WatchlistStock.strikePrice; 0.1); "#,##0.00")
		
		//--------------- finnhub API Call (grabs quote information)
		var $finnhubRequest : 4D.HTTPRequest
		$finnhubRequest:=4D.HTTPRequest.new($finnhubQuoteUrl)
		$finnhubRequest.wait()
		
		If ($finnhubRequest.response.status=200)
			Form.currentPrice:="$"+String(Trunc($finnhubRequest.response.body.c; 2); "##0.00")
			Form.previousClosePrice:="$"+String(Trunc($finnhubRequest.response.body.pc; 2); "##0.00")
			Form.priceDelta:="$"+String(Trunc($finnhubRequest.response.body.d; 2); "##0.00")
			Form.pricePercentage:=Trunc($finnhubRequest.response.body.dp; 2)
			Form.priceStatusString:=String(Form.priceDelta)+" | "+String(Form.pricePercentage; "###0.00")+"% Today"
			
			If ($finnhubRequest.response.body.d<=0)
				OBJECT SET RGB COLORS(*; "changeString"; "rgb(255, 0, 0)"; "rgb(255, 200, 200)")
			Else 
				OBJECT SET RGB COLORS(*; "changeString"; "rgb(0,128,0)"; "rgb(220,255,220)")
			End if 
		Else 
			ALERT("Request failed with the status: "+String($request.statusCode))
		End if 
		
		
		
		
		
	: (Form event code=On Close Box)
		CANCEL
		
		
End case 


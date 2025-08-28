Case of 
	: (Form event code=On Data Change)
		
		Form.WatchlistStock.strikePrice:=Num(Form.strikePriceText)
		Form.strikePriceText:="$"+String(Form.WatchlistStock.strikePrice; "#,##0.00")
		
		//calculate 5% loss from price target
		Form.fivePercentStop:="$"+String(calculateStopLossTarget(Form.WatchlistStock.strikePrice; 0.05); "#,##0.00")
		
		//calculate 10% loss from price target
		Form.tenPercentStop:="$"+String(calculateStopLossTarget(Form.WatchlistStock.strikePrice; 0.1); "#,##0.00")
		
		Form.WatchlistStock.strikePrice:=Num(Form.strikePriceText)
		Form.strikePriceText:="$"+String(Form.WatchlistStock.strikePrice; "#,##0.00")
		
End case 

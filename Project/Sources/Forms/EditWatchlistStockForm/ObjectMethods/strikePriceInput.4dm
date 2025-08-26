Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		Form:C1466.WatchlistStock.strikePrice:=Num:C11(Form:C1466.strikePriceText)
		Form:C1466.strikePriceText:="$"+String:C10(Form:C1466.WatchlistStock.strikePrice; "#,##0.00")
		
		//calculate 5% loss from price target
		Form:C1466.fivePercentStop:="$"+String:C10(calculateStopLossTarget(Form:C1466.WatchlistStock.strikePrice; 0.05); "#,##0.00")
		
		//calculate 10% loss from price target
		Form:C1466.tenPercentStop:="$"+String:C10(calculateStopLossTarget(Form:C1466.WatchlistStock.strikePrice; 0.1); "#,##0.00")
		
		Form:C1466.WatchlistStock.strikePrice:=Num:C11(Form:C1466.strikePriceText)
		Form:C1466.strikePriceText:="$"+String:C10(Form:C1466.WatchlistStock.strikePrice; "#,##0.00")
		
End case 

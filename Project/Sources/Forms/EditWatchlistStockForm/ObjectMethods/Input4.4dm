Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		Form:C1466.WatchlistStock.stopLossPrice:=Num:C11(Form:C1466.stopLossText)
		Form:C1466.stopLossText:="$"+String:C10(Form:C1466.WatchlistStock.stopLossPrice; "###,##0.00")
		
		Form:C1466.WatchlistStock.stopLossPrice:=Num:C11(Form:C1466.stopLossText)
		Form:C1466.stopLossText:="$"+String:C10(Form:C1466.WatchlistStock.stopLossPrice; "###,##0.00")
		
	: (Form event code:C388=On Load:K2:1)
		Form:C1466.fivePercentStop:=calculateStopLossTarget(Form:C1466.WatchlistStock.strikePrice; 0.05)
		Form:C1466.fivePercentStop:=calculateStopLossTarget(Form:C1466.WatchlistStock.strikePrice; 0.1)
End case 

Case of 
	: (Form event code=On Data Change)
		
		Form.WatchlistStock.stopLossPrice:=Num(Form.stopLossText)
		Form.stopLossText:="$"+String(Form.WatchlistStock.stopLossPrice; "###,##0.00")
		
		Form.WatchlistStock.stopLossPrice:=Num(Form.stopLossText)
		Form.stopLossText:="$"+String(Form.WatchlistStock.stopLossPrice; "###,##0.00")
		
	: (Form event code=On Load)
		Form.fivePercentStop:=calculateStopLossTarget(Form.WatchlistStock.strikePrice; 0.05)
		Form.fivePercentStop:=calculateStopLossTarget(Form.WatchlistStock.strikePrice; 0.1)
End case 

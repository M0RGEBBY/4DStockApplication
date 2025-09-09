Case of 
	: (Form event code=On Data Change)
		
		Form.ActivePosition.stopLossPrice:=Num(Form.stopLossText)
		Form.stopLossText:="$"+String(Form.ActivePosition.stopLossPrice; "###,##0.00")
		
		Form.ActivePosition.stopLossPrice:=Num(Form.stopLossText)
		Form.stopLossText:="$"+String(Form.ActivePosition.stopLossPrice; "###,##0.00")
		
		Form.PL:=CalculateTotalPL(Form.stopLossText; Form.purchasePriceText; Form.ActivePosition.sharesOwned)
		
		If (Num(Form.PL)>=0)
			
			Form.PLText:="$"+String(Abs(Form.PL); "##,###,##0.00")
			
		Else 
			
			Form.PLText:="-$"+String(Abs(Form.PL); "##,###,##0.00")
			
		End if 
	: (Form event code=On Load)
		Form.fivePercentStop:=calculateStopLossTarget(Form.WatchlistStock.strikePrice; 0.05)
		Form.fivePercentStop:=calculateStopLossTarget(Form.WatchlistStock.strikePrice; 0.1)
End case 

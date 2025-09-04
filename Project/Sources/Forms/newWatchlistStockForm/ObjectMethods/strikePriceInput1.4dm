Case of 
	: (Form event code=On Data Change)
		
		Form.strikePrice:=Num(Form.strikePriceText)
		Form.strikePriceText:="$"+String(Form.strikePrice; "###,##0.00")
		
		//calculate 5% loss from price target
		Form.fivePercentStop:="$"+String(calculateStopLossTarget(Form.strikePrice; 0.05); "###,##0.00")
		
		//calculate 10% loss from price target
		Form.tenPercentStop:="$"+String(calculateStopLossTarget(Form.strikePrice; 0.1); "###,##0.00")
		
		
End case 

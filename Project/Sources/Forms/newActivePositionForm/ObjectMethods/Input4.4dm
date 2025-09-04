Case of 
	: (Form event code=On Data Change)
		
		Form.stopLossPrice:=Num(Form.stopLossText)
		Form.stopLossText:="$"+String(Form.stopLossPrice; "###,##0.00")
		
		Form.stopLossPrice:=Num(Form.stopLossText)
		Form.stopLossText:="$"+String(Form.stopLossPrice; "###,##0.00")
		
	: (Form event code=On Load)
		Form.fivePercentStop:=calculateStopLossTarget(Form.purchasePrice; 0.05)
		Form.fivePercentStop:=calculateStopLossTarget(Form.purchasePrice; 0.1)
End case 

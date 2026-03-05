Case of 
	: (Form event code=On Data Change)
		
		Form.stopLossPrice:=Num(Form.stopLossText)
		Form.stopLossText:="$"+String(Form.stopLossPrice; "###,##0.00")
		
		Form.stopLossPrice:=Num(Form.stopLossText)
		Form.stopLossText:="$"+String(Form.stopLossPrice; "###,##0.00")
		
		Form.PL:=(Num(Form.stopLossPrice)-Num(Form.purchasePrice))*Num(Form.sharesPurchased)
		
		If (Num(Form.PL)>=0)
			
			Form.PLText:="$"+String(Abs(Form.PL); "##,###,##0.00")
			
		Else 
			
			Form.PLText:="-$"+String(Abs(Form.PL); "##,###,##0.00")
			
		End if 
		
	: (Form event code=On Load)
		
		Form.fivePercentStop:=calculateStopLossTarget(Form.purchasePrice; 0.05)
		
		Form.tenPercentStop:=calculateStopLossTarget(Form.purchasePrice; 0.1)
		
End case 

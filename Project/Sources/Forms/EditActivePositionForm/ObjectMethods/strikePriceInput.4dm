Case of 
	: (Form event code=On Data Change)
		
		Form.ActivePosition.purchasePrice:=Num(Form.purchasePriceText)
		Form.purchasePriceText:="$"+String(Form.ActivePosition.purchasePrice; "#,##0.00")
		
		//calculate 5% loss from price target
		Form.fivePercentStop:="$"+String(calculateStopLossTarget(Form.currentPrice; 0.05); "#,##0.00")
		
		//calculate 10% loss from price target
		Form.tenPercentStop:="$"+String(calculateStopLossTarget(Form.currentPrice; 0.1); "#,##0.00")
		
		Form.purchasePriceText:="$"+String(Form.ActivePosition.purchasePrice; "#,##0.00")
		
		Form.PL:=CalculateTotalPL(Form.stopLossText; Form.purchasePriceText; Form.ActivePosition.sharesOwned)
		If (Num(Form.PL)>=0)
			
			Form.PLText:="$"+String(Abs(Form.PL); "##,###,##0.00")
			
		Else 
			
			Form.PLText:="-$"+String(Abs(Form.PL); "##,###,##0.00")
			
		End if 
		If (Form.ActivePosition.purchasePrice#Null) & (Form.ActivePosition.purchasePrice#0)
			Form.ActivePosition.initialInvestment:="$"+String(Num(Form.ActivePosition.sharesOwned)*Num(Form.purchasePriceText); "#,##0.00")
		End if 
End case 

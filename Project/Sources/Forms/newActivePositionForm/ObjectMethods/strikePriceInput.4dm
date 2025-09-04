Case of 
	: (Form event code=On Data Change)
		
		Form.purchasePrice:=Num(Form.purchasePriceText)
		Form.purchasePriceText:="$"+String(Form.purchasePrice; "#,##0.00")
		
		//calculate 5% loss from price target
		Form.fivePercentStop:="$"+String(calculateStopLossTarget(Form.purchasePrice; 0.05); "#,##0.00")
		
		//calculate 10% loss from price target
		Form.tenPercentStop:="$"+String(calculateStopLossTarget(Form.purchasePrice; 0.1); "#,##0.00")
		
		Form.purchasePrice:=Num(Form.purchasePriceText)
		Form.purchasePiceText:="$"+String(Form.purchasePrice; "#,##0.00")
		
		If (Form.sharesPurchased#Null) & (Form.purchasePrice#0)
			Form.initialInvestment:="$"+String(Num(Form.sharesPurchased)*Num(Form.purchasePrice); "#,##0.00")
		End if 
End case 

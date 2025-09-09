Case of 
	: (Form event code=On Data Change)
		If (Form.ActivePosition.purchasePrice#Null) & (Form.ActivePosition.purchasePrice#0)
			Form.ActivePosition.initialInvestment:="$"+String(Num(Form.ActivePosition.sharesOwned)*Num(Form.purchasePriceText); "#,##0.00")
		End if 
		Form.PL:=CalculateTotalPL(Form.stopLossText; Form.purchasePriceText; Form.ActivePosition.sharesOwned)
		If (Num(Form.PL)>=0)
			
			Form.PLText:="$"+String(Abs(Form.PL); "##,###,##0.00")
			
		Else 
			
			Form.PLText:="-$"+String(Abs(Form.PL); "##,###,##0.00")
			
		End if 
End case 

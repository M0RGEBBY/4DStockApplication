Case of 
	: (Form event code=On Data Change)
		If (Form.purchasePrice#Null) & (Form.purchasePrice#0)
			Form.initialInvestment:="$"+String(Num(Form.sharesPurchased)*Num(Form.purchasePrice); "#,##0.00")
		End if 
End case 

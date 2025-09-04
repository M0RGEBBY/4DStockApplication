Case of 
	: (Form event code=On Data Change)
		
		Form.topResistance:=Num(Form.resistanceText)
		Form.resistanceText:="$"+String(Form.topResistance; "###,##0.00")
		
End case 

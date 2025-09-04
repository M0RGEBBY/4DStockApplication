Case of 
	: (Form event code=On Data Change)
		
		Form.botResistance:=Num(Form.supportText)
		Form.supportText:="$"+String(Form.botResistance; "###,##0.00")
		
End case 

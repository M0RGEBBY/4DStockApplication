Case of 
	: (Form event code=On Data Change)
		
		Form.WatchlistStock.botResistance:=Num(Form.supportText)
		Form.supportText:="$"+String(Form.WatchlistStock.botResistance; "###,##0.00")
		
End case 

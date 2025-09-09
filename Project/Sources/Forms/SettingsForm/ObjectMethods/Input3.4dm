Case of 
	: (Form event code=On Data Change)
		
		Form.WatchlistStock.topResistance:=Num(Form.resistanceText)
		Form.resistanceText:="$"+String(Form.WatchlistStock.topResistance; "###,##0.00")
		
End case 

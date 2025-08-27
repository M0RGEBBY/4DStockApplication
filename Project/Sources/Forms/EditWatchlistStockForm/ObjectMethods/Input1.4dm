Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		Form:C1466.WatchlistStock.topResistance:=Num:C11(Form:C1466.resistanceText)
		Form:C1466.resistanceText:="$"+String:C10(Form:C1466.WatchlistStock.topResistance; "###,##0.00")
		
End case 

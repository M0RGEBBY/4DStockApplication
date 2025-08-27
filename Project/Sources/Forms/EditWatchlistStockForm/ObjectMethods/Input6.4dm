Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		Form:C1466.WatchlistStock.botResistance:=Num:C11(Form:C1466.supportText)
		Form:C1466.supportText:="$"+String:C10(Form:C1466.WatchlistStock.botResistance; "###,##0.00")
		
End case 

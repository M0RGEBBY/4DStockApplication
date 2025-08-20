Case of 
	: (Form event code:C388=On Data Change:K2:15)
		$search:=Form:C1466.search
		Form:C1466.stocks:=ds:C1482.Stock.all()
		If ($search="")
			Form:C1466.stocks:=ds:C1482.Stock.all()
		Else 
			Form:C1466.stocks:=Form:C1466.stocks.query("Ticker = "+$search)
		End if 
		
End case 
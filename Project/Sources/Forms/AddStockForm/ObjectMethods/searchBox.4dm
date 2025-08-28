Case of 
	: (Form event code=On Data Change)
		$search:=Form.search
		Form.stocks:=ds.Stock.all()
		If ($search="")
			Form.stocks:=ds.Stock.all()
		Else 
			Form.stocks:=Form.stocks.query("Ticker = "+$search)
		End if 
		
End case 
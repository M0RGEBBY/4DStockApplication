Case of 
	: (Form event code=On Data Change)
		$search:=Form.search
		Form.stocks:=ds.Stock.all()
		If ($search="")
			Form.stocks:=ds.Stock.all()
		Else 
			Form.stocks:=Form.stocks.query("Ticker = :1"; $search)
		End if 
		
End case 

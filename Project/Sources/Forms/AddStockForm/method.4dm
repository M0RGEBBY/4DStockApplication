Case of 
		
	: (Form event code=On Load)
		$ticker:=""
		$companyName:=""
		Form.stocks:=ds.Stock.all().orderBy("Ticker")
		OBJECT SET ENABLED(*; "nextButton"; False)
		
		
	: (Form event code=On Unload)
End case 
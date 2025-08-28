Case of 
	: (Form event code=On Clicked)
		Form.Ticker:=Form.selectedStock.Ticker
		Form.CompanyName:=Form.selectedStock.CompanyName
		Form.Exchange:=Form.selectedStock.Exchange
		ACCEPT
		DIALOG("newStockInfoForm"; Form)
		CLOSE WINDOW()
		
End case 
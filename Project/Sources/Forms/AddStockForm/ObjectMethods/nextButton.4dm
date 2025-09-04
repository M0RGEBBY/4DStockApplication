Case of 
	: (Form event code=On Clicked)
		Form.Ticker:=Form.selectedStock.Ticker
		Form.CompanyName:=Form.selectedStock.CompanyName
		Form.Exchange:=Form.selectedStock.Exchange
		ACCEPT
		If (Form.Mode="Watchlist")
			DIALOG("newWatchlistStockForm"; Form)
		Else 
			DIALOG("newActivePositionForm"; Form)
		End if 
		CLOSE WINDOW()
		
End case 
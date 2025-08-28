Case of 
	: (Form event code=On Clicked)
		// Open popup and store its reference in the Form object
		Ref:=Open form window("AddStockForm")
		// Pass Form along so popup forms can access the window reference
		DIALOG("AddStockForm")
		
		$watchlist:=PopulateWatchlist
		
		// Assign to form
		Form.watchlistStocks:=$watchlist
		Form.watchlistStocks:=Form.watchlistStocks
		
End case 
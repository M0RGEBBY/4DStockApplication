Case of 
	: (Form event code=On Clicked)
		Ref:=Open form window("AddStockForm")
		// Pass Form along so popup forms can access the window reference
		DIALOG("EditWatchlistStockForm"; New object("WatchlistStock"; Form.selectedWatchlistStock))
		$watchlist:=PopulateWatchlist()
		
		// Assign to form
		Form.watchlistStocks:=$watchlist
		Form.watchlistStocks:=Form.watchlistStocks
End case 

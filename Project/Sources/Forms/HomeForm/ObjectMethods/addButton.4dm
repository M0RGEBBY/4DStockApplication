Case of 
	: (Form event code:C388=On Clicked:K2:4)
		// Open popup and store its reference in the Form object
		Ref:=Open form window:C675("AddStockForm")
		// Pass Form along so popup forms can access the window reference
		DIALOG:C40("AddStockForm")
		
		$watchlist:=PopulateWatchlist
		
		// Assign to form
		Form:C1466.watchlistStocks:=$watchlist
		Form:C1466.watchlistStocks:=Form:C1466.watchlistStocks
		
End case 
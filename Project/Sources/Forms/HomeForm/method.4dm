
Case of 
	: (Form event code=On Load)
		
		$watchlist:=PopulateWatchlist()
		
		// Assign to form
		Form.watchlistStocks:=$watchlist
		
End case 

OBJECT SET ENABLED(*; "removeButton"; Form.selectedWatchlistStock#Null)
OBJECT SET ENABLED(*; "editButton"; Form.selectedWatchlistStock#Null)

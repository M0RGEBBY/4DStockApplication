Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$watchlist:=PopulateWatchlist()
		
		// Assign to form
		Form:C1466.watchlistStocks:=$watchlist
		Form:C1466.watchlistStocks:=Form:C1466.watchlistStocks
End case 

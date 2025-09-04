Case of 
	: (Form event code=On Clicked)
		CONFIRM("Are you sure you want to remove this stock from your watchlist?")
		If (OK=1)
			$watchlistStockEntity:=ds.WatchlistStock.query("UUID =:1"; Form.selectedWatchlistStock.watchlistUUID).first()
			If ($watchlistStockEntity#Null)
				$watchlistStockEntity.drop()  // Deletes the record from the database
				
			End if 
			$watchlist:=PopulateWatchlist()
			
			// Assign to form
			Form.watchlistStocks:=$watchlist
			Form.watchlistStocks:=Form.watchlistStocks
			
			Form.selectedWatchlistStock:=Null
		End if 
End case 

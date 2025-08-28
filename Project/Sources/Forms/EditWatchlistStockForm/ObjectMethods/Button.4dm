Case of 
	: (Form event code=On Clicked)
		
		// Get form values
		$strikePrice:=Form.WatchlistStock.strikePrice
		$stopLossPrice:=Form.WatchlistStock.stopLossPrice
		$bottomResistancePrice:=Form.WatchlistStock.botResistance
		$topResistancePrice:=Form.WatchlistStock.topResistance
		
		
		If ((Num($strikePrice)>0) & (Num($stopLossPrice)>0) & (Num($topResistancePrice)>0) & (Num($bottomResistancePrice)>0))
			
			
			// Lookup the stock by ticker
			$stock:=ds.Stock.query("Ticker=:1"; $ticker)
			
			// Create new WatchlistStock record
			$watchlistStock:=ds.WatchlistStock.new()
			$watchlistStock.StrikePrice:=$strikePrice
			$watchlistStock.StopLossPrice:=$stopLossPrice
			$watchlistStock.TopResistance:=$topResistancePrice
			$watchlistStock.BotResistance:=$bottomResistancePrice
			$watchlistStock.stockUUID:=$stock[0].UUID
			$watchlistStock.save()
			ACCEPT
			
			// Inform user
			CONFIRM("Are you sure you want to edit this watchlist item?")
			
			
			// Close form after user clicks OK
			CLOSE WINDOW()
			
		Else 
			ALERT("Error: You must enter all values.")
		End if 
		
End case 

Case of 
	: (Form event code=On Clicked)
		
		// Get form values
		$strikePrice:=Form.WatchlistStock.strikePrice
		$stopLossPrice:=Form.WatchlistStock.stopLossPrice
		$bottomResistancePrice:=Form.WatchlistStock.botResistance
		$topResistancePrice:=Form.WatchlistStock.topResistance
		
		
		If ((Num($strikePrice)>0) & (Num($stopLossPrice)>0) & (Num($topResistancePrice)>0) & (Num($bottomResistancePrice)>0))
			
			$watchlistStockEntity:=ds.WatchlistStock.query("UUID =:1"; Form.WatchlistStock.watchlistUUID).first()
			
			$watchlistStockEntity.StrikePrice:=$strikePrice
			$watchlistStockEntity.TopResistance:=$topResistancePrice
			$watchlistStockEntity.BotResistance:=$bottomResistancePrice
			$watchlistStockEntity.StopLossPrice:=$stopLossPrice
			
			$watchlistStockEntity.save()
			
			// Inform user
			CONFIRM("Are you sure you want to edit this watchlist item?")
			If (OK=1)
				ACCEPT
			End if 
			
			// Close form after user clicks OK
			CLOSE WINDOW()
			
		Else 
			ALERT("Error: You must enter all values.")
		End if 
		
End case 

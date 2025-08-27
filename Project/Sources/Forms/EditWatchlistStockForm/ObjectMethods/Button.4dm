Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		// Get form values
		$strikePrice:=Form:C1466.WatchlistStock.strikePrice
		$stopLossPrice:=Form:C1466.WatchlistStock.stopLossPrice
		$bottomResistancePrice:=Form:C1466.WatchlistStock.botResistance
		$topResistancePrice:=Form:C1466.WatchlistStock.topResistance
		
		
		If ((Num:C11($strikePrice)>0) & (Num:C11($stopLossPrice)>0) & (Num:C11($topResistancePrice)>0) & (Num:C11($bottomResistancePrice)>0))
			
			
			// Lookup the stock by ticker
			$stock:=ds:C1482.Stock.query("Ticker=:1"; $ticker)
			
			// Create new WatchlistStock record
			$watchlistStock:=ds:C1482.WatchlistStock.new()
			$watchlistStock.StrikePrice:=$strikePrice
			$watchlistStock.StopLossPrice:=$stopLossPrice
			$watchlistStock.TopResistance:=$topResistancePrice
			$watchlistStock.BotResistance:=$bottomResistancePrice
			$watchlistStock.stockUUID:=$stock[0].UUID
			$watchlistStock.save()
			ACCEPT:C269
			
			// Inform user
			CONFIRM:C162("Are you sure you want to edit this watchlist item?")
			
			
			// Close form after user clicks OK
			CLOSE WINDOW:C154()
			
		Else 
			ALERT:C41("Error: You must enter all values.")
		End if 
		
End case 

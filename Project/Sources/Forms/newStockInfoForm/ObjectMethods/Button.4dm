Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		// Get form values
		$strikePrice:=Form:C1466.strikePrice
		$stopLossPrice:=Form:C1466.stopLossPrice
		$bottomResistancePrice:=Form:C1466.bottomResistancePrice
		$topResistancePrice:=Form:C1466.topResistancePrice
		$ticker:=Form:C1466.Ticker  // Assuming you have this in your form
		
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
			$watchlistStock.PercentageFromStrike:=Round:C94(((Num:C11($strikePrice)-Num:C11(Form:C1466.currentPrice))/Num:C11(Form:C1466.currentPrice))*100; 2)
			
			// Save new record
			$watchlistStock.save()
			ACCEPT:C269
			
			// Inform user
			ALERT:C41("Stock successfully added to your watchlist.")
			
			// Close form after user clicks OK
			CLOSE WINDOW:C154()
			
		Else 
			ALERT:C41("Error: You must enter a stop loss, strike price, and ticker to proceed")
		End if 
		
End case 

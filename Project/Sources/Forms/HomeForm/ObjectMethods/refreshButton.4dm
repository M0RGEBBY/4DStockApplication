Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$watchlist:=New collection:C1472
		
		For each ($watchlistStock; ds:C1482.WatchlistStock.all().toCollection())
			
			$obj:=New object:C1471
			$obj.strikePrice:=$watchlistStock.StrikePrice
			$obj.topResistance:=$watchlistStock.TopResistance
			$obj.botResistance:=$watchlistStock.BotResistance
			$obj.stopLossPrice:=$watchlistStock.StopLossPrice
			$obj.percentageFromStrike:=$watchlistStock.PercentageFromStrike
			
			
			
			$stockEntity:=ds:C1482.Stock.query("UUID =:1"; $watchlistStock.stockUUID).first()
			
			$obj.Ticker:=$stockEntity.Ticker
			$obj.CompanyName:=$stockEntity.CompanyName
			
			$watchlist.push($obj)
		End for each 
		
		// Assign to form
		Form:C1466.watchlistStocks:=$watchlist
		Form:C1466.watchlistStocks:=Form:C1466.watchlistStocks
End case 

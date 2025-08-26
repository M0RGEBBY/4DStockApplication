//%attributes = {}
//Builds a collection using values in the WatchlistStock and Stock table. 
//Returns a collection of objects

$watchlist:=New collection:C1472

For each ($watchlistStock; ds:C1482.WatchlistStock.all().toCollection())
	
	$obj:=New object:C1471
	$obj.strikePrice:=$watchlistStock.StrikePrice
	$obj.topResistance:=$watchlistStock.TopResistance
	$obj.botResistance:=$watchlistStock.BotResistance
	$obj.stopLossPrice:=$watchlistStock.StopLossPrice
	
	$stockEntity:=ds:C1482.Stock.query("UUID =:1"; $watchlistStock.stockUUID).first()
	
	$obj.ticker:=$stockEntity.Ticker
	$obj.CompanyName:=$stockEntity.CompanyName
	$obj.currentPrice:=GetCurrentPrice($obj.ticker; $obj.strikePrice)
	$obj.percentageFromStrike:=CalculatePercentageFromStrike($obj.currentPrice; $obj.strikePrice)
	$obj.exchange:=$stockEntity.Exchange
	
	$watchlist.push($obj)
End for each 

return $watchlist
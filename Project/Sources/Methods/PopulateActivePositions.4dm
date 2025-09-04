//%attributes = {}
//Builds a collection using values in the ActivePositions and Stock table. 
//Returns a collection of objects

$activePositions:=New collection

For each ($activePositionStock; ds.ActivePositionStock.all().toCollection())
	
	$obj:=New object
	$obj.purchasePrice:=$activePositionStock.PurchasePrice
	$obj.stopLossPrice:=$activePositionStock.StopLossPrice
	$obj.activePositionUUID:=$activePositionStock.UUID
	$obj.sharesOwned:=$activePositionStock.SharesOwned
	
	$stockEntity:=ds.Stock.query("UUID =:1"; $activePositionStock.stockUUID).first()
	
	$obj.ticker:=$stockEntity.Ticker
	$obj.CompanyName:=$stockEntity.CompanyName
	$obj.currentPrice:=GetCurrentPrice($obj.ticker; $obj.purchasePrice)
	$obj.percentageFromPurchasePrice:=CalculatePercentageFromPurchase($obj.currentPrice; $obj.purchasePrice)
	If (Num($obj.percentageFromPurchasePrice)>0)
		$obj.percentageFromPurchasePrice:="+"+String($obj.percentageFromPurchasePrice; "#######0.00")+"%"
	Else 
		$obj.percentageFromPurchasePrice:=String($obj.percentageFromPurchasePrice; "#######0.00")+"%"
	End if 
	
	$obj.exchange:=$stockEntity.Exchange
	
	$activePositions.push($obj)
End for each 

return $activePositions
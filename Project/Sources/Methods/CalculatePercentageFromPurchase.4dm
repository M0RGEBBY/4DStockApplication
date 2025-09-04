//%attributes = {}
// Description: Takes in a strike price and ticker, calls the finnhub api to grab current price, and then 
// returns the difference between the current price and the strike price (in percentage)

var $finnhubApiKey : Text:="d23pcnpr01qv4g01lod0d23pcnpr01qv4g01lodg"

//Parameters
$currentPrice:=(Num($1))
$purchasePrice:=(Num($2))

$percentageFromPurchasePrice:=Round(((Num($currentPrice)-Num($purchasePrice))/Num($purchasePrice))*100; 2)

return $percentageFromPurchasePrice

//%attributes = {}
// Description: Takes in a strike price and ticker, calls the finnhub api to grab current price, and then 
// returns the difference between the current price and the strike price (in percentage)

var $finnhubApiKey : Text:="d23pcnpr01qv4g01lod0d23pcnpr01qv4g01lodg"

//Parameters
$currentPrice:=(Num:C11($1))
$strikePrice:=(Num:C11($2))

$percentageFromStrike:=Round:C94(((Num:C11($strikePrice)-Num:C11($currentPrice))/Num:C11($currentPrice))*100; 2)

return $percentageFromStrike

//%attributes = {"lang":"en"}
// Description: Takes in a strike price and ticker, calls the finnhub api to grab current price, and then 
// returns the difference between the current price and the strike price (in percentage)

//Parameters
$currentPrice:=(Num($1))
$strikePrice:=(Num($2))

$percentageFromStrike:=Round(((Num($strikePrice)-Num($currentPrice))/Num($currentPrice))*100; 2)

return $percentageFromStrike

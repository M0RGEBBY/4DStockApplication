//%attributes = {}
//This method takes in a stop loss price, purchase price, and shares owned and returns total profit/loss.
$stopLossPrice:=(Num($1))
$purchasePrice:=(Num($2))
$sharesOwned:=(Num($3))

$PL:=($stopLossPrice-$purchasePrice)*$sharesOwned

return $PL


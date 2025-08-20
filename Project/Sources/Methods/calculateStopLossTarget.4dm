//%attributes = {}
//This method takes in a real and a percentage value and outputs the result multipled by eachother
$strikePrice:=(Num:C11($1))
$percentageLoss:=($2)

$lossTarget:=$strikeprice-($strikePrice*$percentageLoss)

return $lossTarget
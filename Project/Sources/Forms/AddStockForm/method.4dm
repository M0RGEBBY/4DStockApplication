Case of 
		
	: (Form event code:C388=On Load:K2:1)
		$ticker:=""
		$companyName:=""
		Form:C1466.stocks:=ds:C1482.Stock.all().orderBy("Ticker")
		OBJECT SET ENABLED:C1123(*; "nextButton"; False:C215)
		
		
	: (Form event code:C388=On Unload:K2:2)
End case 
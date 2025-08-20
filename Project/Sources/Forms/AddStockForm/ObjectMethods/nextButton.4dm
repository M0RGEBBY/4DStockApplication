Case of 
	: (Form event code:C388=On Clicked:K2:4)
		Form:C1466.Ticker:=Form:C1466.selectedStock.Ticker
		Form:C1466.CompanyName:=Form:C1466.selectedStock.CompanyName
		Form:C1466.Exchange:=Form:C1466.selectedStock.Exchange
		ACCEPT:C269
		DIALOG:C40("newStockInfoForm"; Form:C1466)
		CLOSE WINDOW:C154()
		
End case 
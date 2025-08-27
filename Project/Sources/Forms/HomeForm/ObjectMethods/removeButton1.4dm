Case of 
	: (Form event code:C388=On Clicked:K2:4)
		Ref:=Open form window:C675("AddStockForm")
		// Pass Form along so popup forms can access the window reference
		DIALOG:C40("EditWatchlistStockForm"; New object:C1471("WatchlistStock"; Form:C1466.selectedWatchlistStock))
End case 

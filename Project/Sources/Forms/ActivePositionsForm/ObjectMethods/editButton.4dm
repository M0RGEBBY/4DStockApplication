Case of 
	: (Form event code=On Clicked)
		Ref:=Open form window("EditActivePositionForm")
		// Pass Form along so popup forms can access the window reference
		DIALOG("EditActivePositionForm"; New object("ActivePosition"; Form.selectedActivePosition))
		$activePositionStocks:=PopulateActivePositions
		
		// Assign to form
		Form.activePositionStocks:=$activePositionStocks
		Form.activePositionStocks:=Form.activePositionStocks
End case 

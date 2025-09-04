Case of 
	: (Form event code=On Clicked)
		// Open popup and store its reference in the Form object
		Ref:=Open form window("AddStockForm")
		
		Form.Mode:="ActivePositions"
		
		// Pass Form along so popup forms can access the window reference
		DIALOG("AddStockForm"; Form)
		
		$activePositions:=PopulateActivePositions
		
		// Assign to form
		Form.activePositionStocks:=$activePositions
		
End case 
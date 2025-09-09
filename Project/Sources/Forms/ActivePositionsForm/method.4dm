
Case of 
	: (Form event code=On Load)
		
		$activePositionStocks:=PopulateActivePositions
		
		// Assign to form
		Form.activePositionStocks:=$activePositionStocks
		
End case 

OBJECT SET ENABLED(*; "removeButton"; Form.selectedActivePosition#Null)
OBJECT SET ENABLED(*; "editButton"; Form.selectedActivePosition#Null)

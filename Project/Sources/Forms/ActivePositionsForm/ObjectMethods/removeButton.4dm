Case of 
	: (Form event code=On Clicked)
		CONFIRM("Are you sure you want to remove this stock from your watchlist?")
		If (OK=1)
			$activePositionEntity:=ds.ActivePositionStock.query("UUID =:1"; Form.selectedActivePosition.activePositionUUID).first()
			If ($activePositionEntity#Null)
				$activePositionEntity.drop()  // Deletes the record from the database
				
			End if 
			$activePositionStocks:=PopulateActivePositions
			
			// Assign to form
			Form.activePositionStocks:=$activePositionStocks
			Form.activePositionStocks:=Form.activePositionStocks
			
			Form.selectedActivePosition:=Null
		End if 
End case 

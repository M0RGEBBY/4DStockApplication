Case of 
	: (Form event code=On Clicked)
		
		// Get form values
		$purchasePrice:=Form.purchasePrice
		$stopLossPrice:=Form.stopLossPrice
		$ticker:=Form.Ticker
		$sharesPurchased:=Form.sharesPurchased
		
		
		If ((Num($purchasePrice)>0) & (Num($stopLossPrice)>0))
			
			$stock:=ds.Stock.query("Ticker=:1"; $ticker)
			
			$activePositionStock:=ds.ActivePositionStock.new()
			$activePositionStock.PurchasePrice:=$purchasePrice
			$activePositionStock.StopLossPrice:=$stopLossPrice
			$activePositionStock.SharesOwned:=$sharesPurchased
			$activePositionStock.stockUUID:=$stock[0].UUID
			$activePositionStock.save()
			
			ACCEPT
			
			ALERT("Position successfully opened.")
			
			
			// Close form after user clicks OK
			CLOSE WINDOW()
			
		Else 
			ALERT("Error: You must enter all values.")
		End if 
		
End case 

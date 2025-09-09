Case of 
	: (Form event code=On Clicked)
		
		// Get form values
		$purchasePrice:=Num(Form.purchasePriceText)
		$stopLossPrice:=Num(Form.stopLossText)
		$initialInvestment:=Num(Form.ActivePosition.initialInvestment)
		$sharesOwned:=Num(Form.ActivePosition.sharesOwned)
		
		
		If ((Num($purchasePrice)>0) & (Num($stopLossPrice)>0) & ($initialInvestment>0) & ($sharesOwned>0))
			
			$activePositionEntity:=ds.ActivePositionStock.query("UUID =:1"; Form.ActivePosition.activePositionUUID).first()
			
			$activePositionEntity.PurchasePrice:=$purchasePrice
			$activePositionEntity.StopLossPrice:=$stopLossPrice
			$activePositionEntity.SharesOwned:=$sharesOwned
			$activePositionEntity.InitialInvestment:=$initialInvestment
			
			
			
			// Inform user
			CONFIRM("Are you sure you want to edit this watchlist item?")
			If (OK=1)
				$activePositionEntity.save()
				ACCEPT
			End if 
			
			// Close form after user clicks OK
			CLOSE WINDOW()
			
		Else 
			ALERT("Error: You must enter all values.")
		End if 
		
End case 

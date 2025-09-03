Case of 
	: (Form event code=On Clicked)
		Case of 
			: (Form.selectedNavItem.label="Watchlist")
				OBJECT SET SUBFORM(Form; "Subform"; "ActivePositionsForm")
				
		End case 
End case 

Case of 
	: (Form event code=On Selection Change)
		Case of 
			: (Form.selectedNavItem.label="Watchlist")
				OBJECT SET SUBFORM(*; "Subform"; "WatchlistForm")
			: (Form.selectedNavItem.label="Active Positions")
				OBJECT SET SUBFORM(*; "Subform"; "ActivePositionsForm")
			: (Form.selectedNavItem.label="Dashboard")
				OBJECT SET SUBFORM(*; "Subform"; "DashboardForm")
		End case 
End case 
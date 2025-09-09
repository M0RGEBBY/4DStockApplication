Case of 
	: (Form event code=On Selection Change)
		Case of 
			: (Form.selectedNavItem.label="Watchlist")
				OBJECT SET SUBFORM(*; "Subform"; "WatchlistForm")
			: (Form.selectedNavItem.label="Active Positions")
				OBJECT SET SUBFORM(*; "Subform"; "ActivePositionsForm")
			: (Form.selectedNavItem.label="Dashboard")
				OBJECT SET SUBFORM(*; "Subform"; "DashboardForm")
			: (Form.selectedNavItem.label="Journal")
				OBJECT SET SUBFORM(*; "Subform"; "JournalForm")
			: (Form.selectedNavItem.label="Settings")
				OBJECT SET SUBFORM(*; "Subform"; "SettingsForm")
		End case 
End case 
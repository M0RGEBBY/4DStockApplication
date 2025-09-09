Case of 
	: (Form event code=On Load)
		Form.navigationLinks:=New collection()
		
		
		
		C_PICTURE($picDashboard)
		C_PICTURE($picWatchlist)
		C_PICTURE($picActive)
		C_PICTURE($picJournal)
		C_PICTURE($picAdmin)
		
		READ PICTURE FILE(Get 4D folder(Current resources folder)+"Pictures\\dashboard.png"; $picDashboard)
		READ PICTURE FILE(Get 4D folder(Current resources folder)+"Pictures\\eye.png"; $picWatchlist)
		READ PICTURE FILE(Get 4D folder(Current resources folder)+"Pictures\\actives.png"; $picActive)
		READ PICTURE FILE(Get 4D folder(Current resources folder)+"Pictures\\journal.png"; $picJournal)
		READ PICTURE FILE(Get 4D folder(Current resources folder)+"Pictures\\admin.png"; $picAdmin)
		
		Form.navigationLinks.push(New object("label"; "Dashboard"; "icon"; $picDashboard))
		Form.navigationLinks.push(New object("label"; "Watchlist"; "icon"; $picWatchlist))
		Form.navigationLinks.push(New object("label"; "Active Positions"; "icon"; $picActive))
		Form.navigationLinks.push(New object("label"; "Journal"; "icon"; $picJournal))
		Form.navigationLinks.push(New object("label"; "Settings"; "icon"; $picAdmin))
End case 
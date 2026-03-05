// ...existing code...
Case of 
	: (Form event code=On Clicked)
		Form.statusMessage:="Populating stock table. Please wait..."
		SetAPIKey("finnhub"; String(Form.finnhubAPIKey))
		SetAPIKey("polygon"; String(Form.polygonAPIKey))
		
		populateStockTable
		
End case 

Case of 
	: (Form event code=On Clicked)
		$key:=String(Form.polygonAPIKey)
		If ($key="")
			Form.polygonTestResult:="Missing"
			ALERT("Enter a Polygon API key first.")
			return 
		End if 
		
		SetAPIKey("polygon"; $key)
		
		$request:=4D.HTTPRequest.new("https://api.polygon.io/v3/reference/tickers?market=stocks&type=CS&limit=1&apiKey="+$key)
		$request.wait()
		If ($request.response.status=200)
			Form.polygonTestResult:="OK"
		Else 
			Form.polygonTestResult:="Fail"
		End if 
End case 

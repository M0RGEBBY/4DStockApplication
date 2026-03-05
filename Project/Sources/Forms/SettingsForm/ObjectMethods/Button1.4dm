Case of 
	: (Form event code=On Clicked)
		$key:=String(Form.finnhubAPIKey)
		If ($key="")
			Form.finnhubTestResult:="Missing"
			ALERT("Enter a Finnhub API key first.")
			return 
		End if 
		
		SetAPIKey("finnhub"; $key)
		
		$request:=4D.HTTPRequest.new("https://finnhub.io/api/v1/quote?symbol=AAPL&token="+$key)
		$request.wait()
		If ($request.response.status=200)
			Form.finnhubTestResult:="OK"
		Else 
			Form.finnhubTestResult:="Fail"
		End if 
End case 

Case of 
	: (Form event code=On Data Change)
		
		//calculate 5% loss from price target
		Form.fivePercentStop:=calculateStopLossTarget(Form.strikePrice; 0.05)
		
		//calculate 10% loss from price target
		Form.tenPercentStop:=calculateStopLossTarget(Form.strikePrice; 0.1)
		
End case 

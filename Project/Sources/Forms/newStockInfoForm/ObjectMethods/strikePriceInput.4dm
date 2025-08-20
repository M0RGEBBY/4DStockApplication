Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		//calculate 5% loss from price target
		Form:C1466.fivePercentStop:=calculateStopLossTarget(Form:C1466.strikePrice; 0.05)
		
		//calculate 10% loss from price target
		Form:C1466.tenPercentStop:=calculateStopLossTarget(Form:C1466.strikePrice; 0.1)
		
End case 

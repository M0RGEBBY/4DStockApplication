//%attributes = {}
// Return provider API key from APIConfig or empty text when missing.
$provider:=Lowercase(String($1))

If ($provider="")
	return ""
End if 

$selection:=ds.APIConfig.query("Provider = :1"; $provider)
If ($selection.length=0)
	return ""
End if 
$config:=$selection.first()

return String($config.ApiKey)

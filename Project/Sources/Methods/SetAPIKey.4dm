//%attributes = {}
// Create/update provider API key in APIConfig.
$provider:=Lowercase(String($1))
$apiKey:=String($2)

If ($provider="")
	return False
End if 

$selection:=ds.APIConfig.query("Provider = :1"; $provider)
If ($selection.length=0)
	$config:=ds.APIConfig.new()
	$config.Provider:=$provider
Else 
	$config:=$selection.first()
End if 

$config.ApiKey:=$apiKey
$config.save()

return True

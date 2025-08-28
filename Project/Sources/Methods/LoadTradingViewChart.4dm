//%attributes = {"lang":"en"}
C_TEXT($ticker; $prefix; $micCode; $queryFullName; $waName)

$ticker:=String($1)
$micCode:=String($2)
$waName:=String($3)

// Build exchange prefix
Case of 
	: ($micCode="XNAS")
		$prefix:="NASDAQ:"
	: ($micCode="XNYS")
		$prefix:="NYSE:"
	: ($micCode="XASE")
		$prefix:="AMEX:"
	: ($micCode="ARCX")
		$prefix:="AMEX:"
	: ($micCode="BATS")
		$prefix:="BATS:"
	: ($micCode="IEXG")
		$prefix:="IEX:"
	: ($micCode="XPHL")
		$prefix:="PHLX:"
	: ($micCode="XCBO")
		$prefix:="CBOE:"
	Else 
		$prefix:=$micCode
End case 

// Full TradingView symbol
$queryFullName:=$prefix+$ticker

//HTML String
$html:="<div class='tradingview-widget-container'>"+\
"<div id='tradingview_chart'></div>"+\
"<script type='text/javascript' src='https://s3.tradingview.com/tv.js'></script>"+\
"<script type='text/javascript'>"+\
"new TradingView.widget({"+\
"  'width': '100%',"+\
"  'height': '100%',"+\
"  'symbol': '"+$queryFullName+"',"+\
"  'interval': 'D',"+\
"  'timezone': 'Etc/UTC',"+\
"  'theme': 'light',"+\
"  'style': '1',"+\
"  'locale': 'en',"+\
"  'toolbar_bg': '#f1f3f6',"+\
"  'enable_publishing': false,"+\
"  'hide_side_toolbar': false,"+\
"  'allow_symbol_change': true,"+\
"  'container_id': 'tradingview_chart'"+\
"});</script>"+\
"</div>"

$filePath:=String(Temporary folder)+"tradingViewChart.html"
TEXT TO DOCUMENT($filePath; $html)

WA OPEN URL(*; $waName; $filePath)
//Test Comment

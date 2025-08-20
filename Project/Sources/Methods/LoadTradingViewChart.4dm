//%attributes = {}
C_TEXT:C284($ticker; $prefix; $micCode; $queryFullName; $waName)

$ticker:=String:C10($1)
$micCode:=String:C10($2)
$waName:=String:C10($3)

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

$filePath:=String:C10(Temporary folder:C486)+"tradingViewChart.html"
TEXT TO DOCUMENT:C1237($filePath; $html)

WA OPEN URL:C1020(*; $waName; $filePath)
//Test Comment
//Test Comment 2

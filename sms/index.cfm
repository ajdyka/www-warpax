<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
         "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>ARH SMS</title>
  <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>
  <link rel="apple-touch-icon" href="iui/warpax-logo-touch-icon.png" />
  <meta name="apple-touch-fullscreen" content="YES" />
  <style type="text/css" media="screen">@import "iui/cutdown-iui.css";</style>
  <!--- <script type="application/x-javascript" src="iui/iui.js"></script> --->
</head>

<body>
    <div class="toolbar">
        <h1 id="pageTitle">Send an SMS</h1>
    </div>
    
   	<form id="settings" title="" class="panel" selected="true" action="./" method="post">

		<cfif structKeyExists(form,"sendNow") and structKeyExists(form,"securityCode") and form.securityCode EQ "{pin obscured}" and len(form.message)>
	
			<cfhttp url="http://www.maxo.com.au/pages/na.php" method="GET" charset="UTF-8" result="smsResult">
				<cfhttpparam type="URL" name="v"			value="99">
				<cfhttpparam type="URL" name="action"		value="sendsms">  <!--- sendsms --->
				<cfhttpparam type="URL" name="txtto"		value="#form.to#">
				<cfhttpparam type="URL" name="fromphnumber" value="#form.from#">
				<cfhttpparam type="URL" name="key"			value="{key obscured}">
				<cfhttpparam type="URL" name="txtmessage"	value="#form.message#">
			</cfhttp>
	
			<div class="panel">
				Message sent
			</div>

		</cfif>

		<label>Security Code</label>
		<input type="password" name="securityCode">

		<label>From</label>
		<select name="from">
			<option value="0418310677">AJ</option>
			<option value="WARPAX">Warpax</option>
		</select>

		<label>To</label>
		<input type="text" name="to">

		<label>Message</label>
		<input type="text" name="message">

		<input type="submit" name="sendNow" value="Send Message" class="grayButton">

	<form>

</body>
</html>

<div id="header">
	<h2>Please leave your details on the contact form below</h2>
</div>

<div id="content">

	<cfif structKeyExists(form,"enquire") and form.bogus_field_1 is ''>
	
		<cfmail to="accounts@warpax.com" from="no-reply@warpax.com" subject="warpax website enquiry" server="localhost" type="html"><cfoutput><p>#replace(form.comment,"#chr(10)#","</p><p>","all")#</p></cfoutput><cfdump var="#cgi#"></cfmail>
	
		<cfset session.enquiry = 'done'>
		
		<cflocation url="#cgi.SCRIPT_NAME#" addtoken="no">
	
	<cfelseif structKeyExists(session,'enquiry') and session.enquiry is 'done'>
		
		<div id="form">
		<p>Thankyou for your message.</p>
		<p><a href="./" id="noIndent">Continue ...</a></p>
		</div>
	
	<cfelse>
	
	<div id="form">
	<cfform method="post" action="#cgi.SCRIPT_NAME#">
	
		<input type="hidden" name="bogus_field_1" value="" />
		
		<textarea name="comment"></textarea>
		
		<input type="submit" name="enquire" value="Send" />
		
	</cfform>
	</div>
	
	</cfif>
	
</div>
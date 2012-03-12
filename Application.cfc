<cfcomponent output="false">

	<!--- Name the application. --->
	<cfset this.name = "warpax-www">
	<!--- Turn on session management. --->
	<cfset this.sessionManagement = true>
	<cfset this.clientManagement = true>
	
	<cffunction name="onApplicationStart" returnType="void" output="false">
		<cfset application.dsn = 'warpax'>
		<cfset application.siteID = '{site id obscured}'>
		<cfset application.user = '{user obscured}'>
		<cfif cgi.http_host IS 'www.warpax.com'>
			<cfset application.currentServer = #cgi.HTTP_HOST#>
		<cfelse>
			<cfset application.currentServer = "localhost/warpax/local/www">
		</cfif>
	</cffunction>  
	
	<cffunction name="onRequestStart" output="yes">
		<cfsetting showdebugoutput="no">
	
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<title>Warpax Technology Solutions</title>
			<meta http-equiv="content-type" content="text/html;charset=UTF-8" />    
			<link media="screen" type="text/css" href="css/screen.css" rel="stylesheet">
			<link media="screen" type="text/css" href="css/easySlider.css" rel="stylesheet">
			<script type="text/javascript" src="js/jquery.js"></script>
			<script type="text/javascript" src="js/easySlider1.5.js"></script>
			<script type="text/javascript" src="js/twitter-1.12.2.min.js"></script>
			<script type="text/javascript" src="http://twitter.com/javascripts/blogger.js"></script>
			<script type="text/javascript" src="http://twitter.com/statuses/user_timeline/warpax.json?callback=twitterCallback2&count=10"></script>	</body>
			<script type="text/javascript">
				$(document).ready(function(){	
					$("##slider").easySlider({
						auto: true, 
						continuous: true,
						pause: 5000				
					});
					$("##gallery").easySlider({
						auto: true, 
						continuous: true,
						pause: 10000				
					});
					getTwitters('warpaxTweet', { 
						id: 'warpax', 
						count: 5, 
						enableLinks: true, 
						ignoreReplies: true, 
						clearContents: true,
						template: '"%text%""'
					});
					getTwitters('ajTweet', { 
						id: 'ajdyka', 
						count: 5, 
						enableLinks: true, 
						ignoreReplies: true, 
						clearContents: true,
						template: '"%text%""'
					});
				});	
			</script>
			
		</head>
		<body>
		
		<div id="container">
		
			<div id="title">
			</div>

	
	</cffunction>

	<cffunction name="onRequestEnd" output="yes" hint="insert the google analytics code if the site is live">

			<div id="footer">
				<a href="./">Home</a> &nbsp; /  &nbsp; <a href="./contact.cfm">Contact</a> &nbsp; / &nbsp; <a href="./gallery.cfm">Gallery</a> &nbsp; / &nbsp; <a href="./developer.cfm">Developer</a>
			</div>
		
		</div>

		<cfif cgi.HTTP_HOST is 'www.warpax.com'>
			<cfinvoke component="warpaxCFC.google.googleAnalyticsCode" method="insertJS" siteid="#application.siteid#" />
		</cfif>
		</body>
		</html>
	</cffunction>

</cfcomponent>

<!--- refresh access token --->
<cfset application.oauth2.refreshToken() />
<cflocation url="index.cfm" />
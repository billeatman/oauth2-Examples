<cfif structKeyExists(URL, 'code')>
	<!---
		We have the code from the authentication, 
		so let's obtain the access token.
	--->
	<cfset authResponse = application.oauth2.getAccessToken(code = URL.code) />
	<cfif authResponse.success>
		<cflocation url="index.cfm" addtoken="false">
	<cfelse>
		<!---
			Failure to authenticate.
			Handle this however you want to.
		--->
		failed authentication.
	</cfif>
</cfif>

<cfdump var="#application.oauth2.getTokenStruct()#">		
<!---
	If the SESSION key exists, we seem to have access to the API.
--->
<cfif application.oauth2.isAuth()>
	<a href="revoke.cfm">Revoke API Access</a>		

	<!--- you can take this out.  Used to easily test refresh token. --->
	<cfif application.oauth2.isRefresh()>			
		<cfoutput><a href="refresh.cfm">Refresh Token!</cfoutput>
	</cfif>
<cfelse>

<!---
	We are not logged in or authenticated.
	Let's do that now so that the user can access the Analytics data.
--->
	<cfoutput><a href="#application.oauth2.getLoginURL()#">Login and Authenticate</a></cfoutput>

	<cfif application.oauth2.isRefresh()>			
		<cfoutput><a href="refresh.cfm">Refresh Token!</cfoutput>
	</cfif>
</cfif>


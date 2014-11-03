<cfcomponent output="false">

<!--- Application settings --->
<cfset this.name = "oauth2-test" />
<cfset this.sessionManagement = true />
<cfset this.sessionTimeout = createTimeSpan(0,2,30,0) />
 
	<cffunction name="onApplicationStart" 
				access="public" 
				returntype="boolean"
				output="false"
				hint="Fires when the application is first created.">

			<!--- remove previous access and struct --->
			<cftry>		
			<cfset application.oauth2.revokeAccess()>
			<cfcatch>
			</cfcatch>
			</cftry>

			<!--- CHANGE ME --->
			<!--- Fill in your own client_id, client_secret and scope --->
			<cfset application.oauth2 = new oauth2.oauth2(
				client_id 		=   'YOUR %Client ID%',
				client_secret 	= 	'YOUR %Client secret%',
				redirect_uri	=	'http://localhost/oauth2/index.cfm',
				scope           =   'https://www.googleapis.com/auth/calendar',
				state			=	'',
				access_type		=	'offline', <!--- Use offline for refresh tokens --->
				approval_prompt	=	'force'
			) />

		<cfreturn true />
	</cffunction>
 
	<cffunction
		name="onRequestStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires at first part of page processing.">
		
			<cfif structKeyExists(URL, 'reinit')>
				<cfset onApplicationStart() />
			</cfif>
	
		<cfreturn true />
	</cffunction>
 
</cfcomponent>
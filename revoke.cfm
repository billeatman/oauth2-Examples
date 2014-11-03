<!--- Revoke access --->
<cfset revokeAccess = application.oauth2.revokeAccess() />
<cflocation url="index.cfm?reinit=1" addtoken="false" />
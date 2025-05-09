<#ftl output_format="HTML">
<#import "template.ftl" as layout>
<@layout.emailLayout>
    ${msg("executeActionsBodyHtml",link,linkExpiration,realmName,requiredActions?join(", "))?no_esc}
</@layout.emailLayout>
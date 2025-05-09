<#ftl output_format="HTML">
<#import "template.ftl" as layout>
<@layout.emailLayout>
    ${msg("passwordResetBodyHtml",link,linkExpiration,realmName)?no_esc}
</@layout.emailLayout>
<#ftl output_format="HTML">
<#import "template.ftl" as layout>
<@layout.emailLayout>
    ${msg("emailVerificationBodyHtml",link,linkExpiration,realmName)?no_esc}
</@layout.emailLayout>
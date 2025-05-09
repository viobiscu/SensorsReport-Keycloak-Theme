<#ftl output_format="HTML">
<#import "template.ftl" as layout>
<@layout.emailLayout>
    ${kcSanitize(msg("event" + eventType + "BodyHtml", eventDate, eventIpAddress))?no_esc}
</@layout.emailLayout>
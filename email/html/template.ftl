<#ftl output_format="HTML">
<#macro emailLayout>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${msg("emailTitle",realmName)}</title>
    <style type="text/css">
        ${properties.stylesCommon?no_esc}
        ${properties.stylesHeader?no_esc}
        ${properties.stylesBody?no_esc}
        ${properties.stylesFooter?no_esc}
    </style>
</head>
<body>
    <div class="header">
        <img src="cid:logo" alt="SensorsReport" style="max-height: 65px;" />
    </div>
    <div class="body">
        <h2>${msg("greeting", user.firstName!"")}</h2>
        <#nested>
    </div>
    <div class="footer">
        <p>&copy; ${.now?string('yyyy')} SensorsReport. ${msg("allRightsReserved")}</p>
    </div>
</body>
</html>
</#macro>
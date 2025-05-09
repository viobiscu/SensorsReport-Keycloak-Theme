<#macro mainLayout active bodyClass>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>${msg("adminConsole")} | ${realm.displayName}</title>
    <link rel="icon" href="${resourcesPath}/img/favicon.ico">
    <!-- Add Font Awesome and Google Fonts -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;900&display=swap" rel="stylesheet">
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>
<body class="${bodyClass}">
    <nav class="navbar navbar-default navbar-pf" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="${adminConsoleBaseUri}">
                <img class="navbar-brand-icon" src="${resourcesPath}/img/SensorsReport_logo.png" alt="SensorsReport Logo" />
            </a>
        </div>
        <div class="navbar-collapse navbar-collapse-1">
            <div class="container">
                <ul class="nav navbar-nav navbar-utility">
                    <#if realm.internationalizationEnabled>
                        <li>
                            <div class="kc-dropdown" id="kc-locale-dropdown">
                                <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                <ul>
                                    <#list locale.supported as l>
                                        <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                    </#list>
                                </ul>
                            </div>
                        </li>
                    </#if>
                    <li><a href="${adminConsoleBaseUri}"><i class="fa fa-home"></i></a></li>
                    <li><a href="${properties.documentationUrl}" target="_blank"><i class="fa fa-question-circle"></i></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="pficon pficon-user"></span>
                            ${auth.user.displayName}<b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${adminConsoleBaseUri}/account">Manage Account</a></li>
                            <li><a href="${adminConsoleBaseUri}/auth/realms/${realm.name}/protocol/openid-connect/logout">Sign Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="bs-sidebar col-sm-3">
            <ul>
                <li class="<#if active=='realms'>active</#if>"><a href="${adminConsoleBaseUri}/realms">${msg("realms")}</a></li>
                <#if auth.user.realm.accessGranted>
                    <li class="<#if active=='users'>active</#if>"><a href="${adminConsoleBaseUri}/realms/${realm.name}/users">${msg("users")}</a></li>
                    <li class="<#if active=='groups'>active</#if>"><a href="${adminConsoleBaseUri}/realms/${realm.name}/groups">${msg("groups")}</a></li>
                    <li class="<#if active=='roles'>active</#if>"><a href="${adminConsoleBaseUri}/realms/${realm.name}/roles">${msg("roles")}</a></li>
                    <li class="<#if active=='clients'>active</#if>"><a href="${adminConsoleBaseUri}/realms/${realm.name}/clients">${msg("clients")}</a></li>
                    <li class="<#if active=='identity-providers'>active</#if>"><a href="${adminConsoleBaseUri}/realms/${realm.name}/identity-provider-settings">${msg("identityProviders")}</a></li>
                </#if>
            </ul>
        </div>

        <div class="col-sm-9 content-area">
            <#if message?has_content>
                <div class="alert alert-${message.type}">
                    <#if message.type=='success' ><span class="pficon pficon-ok"></span></#if>
                    <#if message.type=='error' ><span class="pficon pficon-error-circle-o"></span></#if>
                    ${message.summary?no_esc}
                </div>
            </#if>

            <#nested "content">
        </div>
    </div>

    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script type="text/javascript" src="${resourcesPath}/${script}"></script>
        </#list>
    </#if>
</body>
</html>
</#macro>
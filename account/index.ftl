<!DOCTYPE html>
<html lang="${locale!'en'}">>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    
    <title>${msg("accountManagementTitle")} - Termograf</title>
    
    <link rel="icon" href="${(url.resourcesPath)!'/resources'}/${(properties.favIconUrl)!'favicon.ico'}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;900&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${(url.resourcesPath)!'/resources'}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${(url.resourcesPath)!'/resources'}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    
    <!-- Pass the dynamic resource path to JavaScript -->
    <script>
        window.KEYCLOAK_RESOURCE_PATH = "${(url.resourcesPath)!'/resources'}";
    </script>
</head>

<body class="tg-account-page">
    <div id="tg-account-container">
        <header class="tg-account-header">
            <div class="tg-logo-container">
                <img src="${(url.resourcesPath)!'/resources'}/${(properties.logoUrl)!'img/logo.png'}" alt="${(properties.logoAlt)!'Termograf'}" class="tg-logo">
            </div>
            <h1>${msg("accountManagementTitle")}</h1>
            <p class="tg-account-tagline">Manage your Termograf account settings and security preferences</p>
        </header>
        
        <main class="tg-account-content">
            <div class="tg-account-card">
                <div class="tg-account-welcome">
                    <h2>${msg("accountManagementWelcomeMessage")}</h2>
                    <p>${msg("accountManagementIntroMessage", account.username)}</p>
                </div>
                
                <div class="tg-account-sections">
                    <div class="tg-account-section">
                        <div class="tg-account-section-icon">
                            <i class="fas fa-user-circle"></i>
                        </div>
                        <div class="tg-account-section-content">
                            <h3>${msg("personalInfoHtml")}</h3>
                            <p>View and edit your personal information and profile details</p>
                            <div class="tg-account-actions">
                                <a href="${url.accountUrl}" class="tg-btn tg-btn-primary">
                                    <i class="fas fa-user-edit"></i> ${msg("account")}
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="tg-account-section">
                        <div class="tg-account-section-icon">
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="tg-account-section-content">
                            <h3>${msg("passwordAndAuthenticationHtml")}</h3>
                            <p>Manage your password and authentication settings</p>
                            <div class="tg-account-actions">
                                <a href="${url.passwordUrl}" class="tg-btn tg-btn-secondary">
                                    <i class="fas fa-key"></i> ${msg("password")}
                                </a>
                                <#if features.identityFederation>
                                    <a href="${url.socialUrl}" class="tg-btn tg-btn-secondary">
                                        <i class="fas fa-globe"></i> ${msg("federatedIdentity")}
                                    </a>
                                </#if>
                                <a href="${url.totpUrl}" class="tg-btn tg-btn-secondary">
                                    <i class="fas fa-shield-alt"></i> ${msg("authenticator")}
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <#if features.log>
                        <div class="tg-account-section">
                            <div class="tg-account-section-icon">
                                <i class="fas fa-desktop"></i>
                            </div>
                            <div class="tg-account-section-content">
                                <h3>${msg("deviceActivityHtml")}</h3>
                                <p>View and manage your active sessions and device history</p>
                                <div class="tg-account-actions">
                                    <a href="${url.sessionsUrl}" class="tg-btn tg-btn-secondary">
                                        <i class="fas fa-history"></i> ${msg("sessions")}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#if>
                    
                    <#if referrer?has_content && referrer.url?has_content>
                        <div class="tg-account-section">
                            <div class="tg-account-section-icon">
                                <i class="fas fa-arrow-left"></i>
                            </div>
                            <div class="tg-account-section-content">
                                <h3>Return to Application</h3>
                                <p>Go back to the application you were using</p>
                                <div class="tg-account-actions">
                                    <a href="${referrer.url}" class="tg-btn tg-btn-accent">
                                        <i class="fas fa-external-link-alt"></i> ${msg("backTo", referrer.name)}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </main>
        
        <footer class="tg-account-footer">
            <div class="tg-footer-content">
                <div class="tg-footer-links">
                    <a href="#" class="tg-footer-link"><i class="fas fa-file-contract"></i> Terms of Service</a>
                    <a href="#" class="tg-footer-link"><i class="fas fa-shield-alt"></i> Privacy Policy</a>
                    <a href="#" class="tg-footer-link"><i class="fas fa-question-circle"></i> Help Center</a>
                    <a href="#" class="tg-footer-link"><i class="fas fa-envelope"></i> Contact Support</a>
                </div>
                <div class="tg-footer-copyright">
                    &copy; ${.now?string('yyyy')} Termograf. All rights reserved.
                </div>
            </div>
        </footer>
    </div>
</body>
</html>
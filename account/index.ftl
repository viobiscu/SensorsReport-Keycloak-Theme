<!DOCTYPE html>
<html lang="${locale}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    
    <title>${msg("accountManagementTitle")} - SensorsReport</title>
    
    <link rel="icon" href="${url.resourcesPath}/${properties.favIconUrl}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;900&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="sr-account-page">
    <div id="sr-account-container">
        <header class="sr-account-header">
            <div class="sr-logo-container">
                <img src="${url.resourcesPath}/${properties.logoUrl}" alt="${properties.logoAlt}" class="sr-logo">
            </div>
            <h1>${msg("accountManagementTitle")}</h1>
            <p class="sr-account-tagline">Manage your SensorsReport account settings and security preferences</p>
        </header>
        
        <main class="sr-account-content">
            <div class="sr-account-card">
                <div class="sr-account-welcome">
                    <h2>${msg("accountManagementWelcomeMessage")}</h2>
                    <p>${msg("accountManagementIntroMessage", account.username)}</p>
                </div>
                
                <div class="sr-account-sections">
                    <div class="sr-account-section">
                        <div class="sr-account-section-icon">
                            <i class="fas fa-user-circle"></i>
                        </div>
                        <div class="sr-account-section-content">
                            <h3>${msg("personalInfoHtml")}</h3>
                            <p>View and edit your personal information and profile details</p>
                            <div class="sr-account-actions">
                                <a href="${url.accountUrl}" class="sr-btn sr-btn-primary">
                                    <i class="fas fa-user-edit"></i> ${msg("account")}
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="sr-account-section">
                        <div class="sr-account-section-icon">
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="sr-account-section-content">
                            <h3>${msg("passwordAndAuthenticationHtml")}</h3>
                            <p>Manage your password and authentication settings</p>
                            <div class="sr-account-actions">
                                <a href="${url.passwordUrl}" class="sr-btn sr-btn-secondary">
                                    <i class="fas fa-key"></i> ${msg("password")}
                                </a>
                                <#if features.identityFederation>
                                    <a href="${url.socialUrl}" class="sr-btn sr-btn-secondary">
                                        <i class="fas fa-globe"></i> ${msg("federatedIdentity")}
                                    </a>
                                </#if>
                                <a href="${url.totpUrl}" class="sr-btn sr-btn-secondary">
                                    <i class="fas fa-shield-alt"></i> ${msg("authenticator")}
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <#if features.log>
                        <div class="sr-account-section">
                            <div class="sr-account-section-icon">
                                <i class="fas fa-desktop"></i>
                            </div>
                            <div class="sr-account-section-content">
                                <h3>${msg("deviceActivityHtml")}</h3>
                                <p>View and manage your active sessions and device history</p>
                                <div class="sr-account-actions">
                                    <a href="${url.sessionsUrl}" class="sr-btn sr-btn-secondary">
                                        <i class="fas fa-history"></i> ${msg("sessions")}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#if>
                    
                    <#if referrer?has_content && referrer.url?has_content>
                        <div class="sr-account-section">
                            <div class="sr-account-section-icon">
                                <i class="fas fa-arrow-left"></i>
                            </div>
                            <div class="sr-account-section-content">
                                <h3>Return to Application</h3>
                                <p>Go back to the application you were using</p>
                                <div class="sr-account-actions">
                                    <a href="${referrer.url}" class="sr-btn sr-btn-accent">
                                        <i class="fas fa-external-link-alt"></i> ${msg("backTo", referrer.name)}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#if>
                </div>
            </div>
        </main>
        
        <footer class="sr-account-footer">
            <div class="sr-footer-content">
                <div class="sr-footer-links">
                    <a href="#" class="sr-footer-link"><i class="fas fa-file-contract"></i> Terms of Service</a>
                    <a href="#" class="sr-footer-link"><i class="fas fa-shield-alt"></i> Privacy Policy</a>
                    <a href="#" class="sr-footer-link"><i class="fas fa-question-circle"></i> Help Center</a>
                    <a href="#" class="sr-footer-link"><i class="fas fa-envelope"></i> Contact Support</a>
                </div>
                <div class="sr-footer-copyright">
                    &copy; ${.now?string('yyyy')} SensorsReport. All rights reserved.
                </div>
            </div>
        </footer>
    </div>
</body>
</html>
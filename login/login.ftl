<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>
<#import "field.ftl" as field>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <style>.pf-v5-c-login__main-header { display: none !important; }</style>
    <#elseif section = "form">
        <div id="kc-form">
          <div id="kc-form-wrapper" class="termograf-form-wrapper">
            <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="termograf-form-header">
                        <img src="${url.resourcesPath}/img/Termograf-Icon.png" alt="Termograf Icon" class="termograf-icon" width="50" height="50">
                        <h2>${msg("loginWelcomeTitle")}</h2>
                        <p>${msg("loginWelcomeSubtitle")}</p>
                    </div>

                    <div class="termograf-form-fields">
                        <@field.group name="username" label=msg('usernameOrEmail')>
                            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />
                        </@field.group>

                        <@field.group name="password" label=msg('password')>
                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />
                        </@field.group>

                        <div class="tg-form-options-row">
                            <div id="kc-form-options" class="tg-remember-me">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="checkbox">
                                        <label>
                                            <#if login.rememberMe??>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                            <#else>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                            </#if>
                                        </label>
                                    </div>
                                </#if>
                            </div>
                            <div class="tg-forgot-password">
                                <#if realm.resetPasswordAllowed>
                                    <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="tg-forgot-password-link">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>
                        </div>

                        <div id="kc-form-buttons" class="tg-submit-row">
                            <button class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} tg-btn-submit" 
                                    name="login" id="kc-login" type="submit" tabindex="4" value="${msg("doLogIn")}">
                                ${msg("doLogIn")}
                            </button>
                        </div>
                    </div>
                </form>
            </#if>
          </div>
        </div>
    <#elseif section = "info">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container" class="termograf-register-container">
                <div class="termograf-register-prompt">
                    <span>${msg("noAccount")}</span>
                    <a tabindex="6" href="${url.registrationUrl}" class="termograf-register-link">${msg("doRegister")}</a>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>

<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>
<#import "field.ftl" as field>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <div id="kc-form">
          <div id="kc-form-wrapper" class="sensors-report-form-wrapper">
            <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="sensors-report-form-header">
                        <img src="${url.resourcesPath}/img/SensorsReport-Icon.png" alt="SensorsReport Icon" class="sensors-report-icon" width="50" height="50">
                        <h2>Welcome to SensorsReport</h2>
                        <p>Environmental monitoring for perishable goods</p>
                    </div>
                    
                    <@field.group name="username" label=msg('usernameOrEmail')>
                        <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                    </@field.group>

                    <@field.group name="password" label=msg('password')>
                        <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                    </@field.group>

                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options">
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
                        <div class="${properties.kcFormOptionsWrapperClass!} sr-forgot-password-wrapper">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}" class="sr-forgot-password-link">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <@buttons.primary type="submit" size="large" name="login" value=msg("doLogIn")>
                            ${msg("doLogIn")}
                        </@buttons.primary>
                    </div>
                </form>
            </#if>
          </div>
        </div>
    <#elseif section = "info">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container" class="sensors-report-register-container">
                <div class="sensors-report-register-prompt">
                    <span>${msg("noAccount")}</span>
                    <a tabindex="6" href="${url.registrationUrl}" class="sensors-report-register-link">${msg("doRegister")}</a>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>

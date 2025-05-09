<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>
<#import "field.ftl" as field>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper" class="sensors-report-form-wrapper">
                <div class="sensors-report-form-header">
                    <h2>Create Your Account</h2>
                    <p>Fill in your information to get started</p>
                </div>
                
                <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
                    <div class="register-fields-container">
                        <@field.group name="firstName" label=msg("firstName")>
                            <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName"
                                   value="${(register.formData.firstName!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                            />
                        </@field.group>

                        <@field.group name="lastName" label=msg("lastName")>
                            <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName"
                                   value="${(register.formData.lastName!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                            />
                        </@field.group>

                        <@field.group name="email" label=msg("email")>
                            <input type="text" id="email" class="${properties.kcInputClass!}" name="email"
                                   value="${(register.formData.email!'')}" autocomplete="email"
                                   aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                            />
                        </@field.group>

                        <#if !realm.registrationEmailAsUsername>
                            <@field.group name="username" label=msg("username")>
                                <input type="text" id="username" class="${properties.kcInputClass!}" name="username"
                                       value="${(register.formData.username!'')}" autocomplete="username"
                                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                />
                            </@field.group>
                        </#if>

                        <#if passwordRequired??>
                            <@field.group name="password" label=msg("password")>
                                <input type="password" id="password" class="${properties.kcInputClass!}" name="password"
                                       autocomplete="new-password"
                                       aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                />
                            </@field.group>

                            <@field.group name="password-confirm" label=msg("passwordConfirm")>
                                <input type="password" id="password-confirm" class="${properties.kcInputClass!}"
                                       name="password-confirm"
                                       aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                />
                            </@field.group>
                        </#if>

                        <#if recaptchaRequired??>
                            <div class="form-group">
                                <div class="${properties.kcInputWrapperClass!}">
                                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                                </div>
                            </div>
                        </#if>

                        <div class="${properties.kcFormGroupClass!}">
                            <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                                <div class="${properties.kcFormOptionsWrapperClass!}">
                                    <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                                </div>
                            </div>

                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <@buttons.primary type="submit" name="register" value=msg("doRegister")>
                                    ${msg("doRegister")}
                                </@buttons.primary>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
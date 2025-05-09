<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
    <#if section = "header">
        ${msg("privacyPolicyTitle")}
    <#elseif section = "form">
        <div class="pf-v5-c-content legal-content">
            <h2>${msg("privacyPolicyTitle")}</h2>
            <p class="effective-date">${msg("privacyPolicyEffectiveDate")}</p>
            
            <section>
                <h3>${msg("privacyPolicySection1Title")}</h3>
                <p>${msg("privacyPolicySection1Text")}</p>
                <ul>
                    <#list msg("privacyPolicySection1List")?split(";") as item>
                        <li>${item}</li>
                    </#list>
                </ul>
            </section>

            <section>
                <h3>${msg("privacyPolicySection2Title")}</h3>
                <p>${msg("privacyPolicySection2Text")}</p>
                <ul>
                    <#list msg("privacyPolicySection2List")?split(";") as item>
                        <li>${item}</li>
                    </#list>
                </ul>
            </section>

            <section>
                <h3>${msg("privacyPolicySection3Title")}</h3>
                <p>${msg("privacyPolicySection3Text")}</p>
            </section>

            <section>
                <h3>${msg("privacyPolicySection4Title")}</h3>
                <p>${msg("privacyPolicySection4Text")}</p>
                <p>Email: ${msg("privacyPolicyContactEmail")}</p>
            </section>
        </div>
    </#if>
</@layout.registrationLayout>
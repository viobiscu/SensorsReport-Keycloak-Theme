<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false; section>
    <#if section = "header">
        ${msg("termsOfServiceTitle")}
    <#elseif section = "form">
        <div class="pf-v5-c-content legal-content">
            <h2>${msg("termsOfServiceTitle")}</h2>
            <p class="effective-date">${msg("termsOfServiceEffectiveDate")}</p>
            
            <section>
                <h3>${msg("termsOfServiceSection1Title")}</h3>
                <p>${msg("termsOfServiceSection1Text")}</p>
            </section>

            <section>
                <h3>${msg("termsOfServiceSection2Title")}</h3>
                <p>${msg("termsOfServiceSection2Text")}</p>
                <ul>
                    <#list msg("termsOfServiceSection2List")?split(";") as item>
                        <li>${item}</li>
                    </#list>
                </ul>
            </section>

            <section>
                <h3>${msg("termsOfServiceSection3Title")}</h3>
                <p>${msg("termsOfServiceSection3Text")}</p>
                <ul>
                    <#list msg("termsOfServiceSection3List")?split(";") as item>
                        <li>${item}</li>
                    </#list>
                </ul>
            </section>

            <section>
                <h3>${msg("termsOfServiceSection4Title")}</h3>
                <p>${msg("termsOfServiceSection4Text")}</p>
                <p>Email: ${msg("termsOfServiceContactEmail")}</p>
            </section>
        </div>
    </#if>
</@layout.registrationLayout>
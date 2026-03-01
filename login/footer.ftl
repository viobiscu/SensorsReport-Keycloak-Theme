<#macro content>
<div class="termograf-footer">
    <div class="termograf-footer-content">
        <div class="termograf-footer-links">
            <a href="${url.resourcesPath}/privacy-policy.html" class="termograf-footer-link"><i class="fas fa-shield-alt"></i> ${msg("privacy")}</a>
            <a href="${url.resourcesPath}/terms-of-service.html" class="termograf-footer-link"><i class="fas fa-file-contract"></i> ${msg("terms")}</a>
            <a href="#" class="termograf-footer-link"><i class="fas fa-question-circle"></i> ${msg("doContactSupport")}</a>
        </div>
        <div class="termograf-footer-copyright">
            © ${.now?string('yyyy')} Termograf - ${msg("allRightsReserved")}
        </div>
    </div>
</div>
</#macro>

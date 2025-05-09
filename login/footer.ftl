<#macro content>
<div class="sensors-report-footer">
    <div class="sensors-report-footer-content">
        <div class="sensors-report-footer-links">
            <a href="${url.resourcesPath}/privacy-policy.html" class="sensors-report-footer-link"><i class="fas fa-shield-alt"></i> ${msg("privacy")}</a>
            <a href="${url.resourcesPath}/terms-of-service.html" class="sensors-report-footer-link"><i class="fas fa-file-contract"></i> ${msg("terms")}</a>
            <a href="#" class="sensors-report-footer-link"><i class="fas fa-question-circle"></i> ${msg("doContactSupport")}</a>
        </div>
        <div class="sensors-report-footer-copyright">
            © ${.now?string('yyyy')} SensorsReport - ${msg("allRightsReserved")}
        </div>
    </div>
</div>
</#macro>

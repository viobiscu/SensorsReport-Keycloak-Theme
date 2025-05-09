<#macro actionGroup horizontal=false>
  <div class="${properties.kcFormGroupClass}">
    <div class="${properties.kcFormActionGroupClass} <#if horizontal>pf-v5-u-flex-nowrap<#else>pf-v5-u-flex-wrap</#if>">
      <#nested>
    </div>
  </div>
</#macro>

<#macro button label id="" name="" class=["kcButtonPrimaryClass"] extra...>
  <button class="<#list class as c>${properties[c]} </#list>" name="${name}" id="${id}"
          type="submit" <#list extra as attrName, attrVal>${attrName}="${attrVal}"</#list>>
  ${kcSanitize(msg(label))?no_esc}
  </button>
</#macro>

<#macro buttonLink href label id="" class=["kcButtonSecondaryClass"]>
  <a id="${id}" href="${href}" class="<#list class as c>${properties[c]} </#list>">${kcSanitize(msg(label))?no_esc}</a>
</#macro>

<#macro primary type="submit" size="" name="" value="" id="">
  <button class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${size?has_content?then('btn-' + size, '')}" 
          name="${name}" id="${id}" type="${type}" value="${value}"
          <#if nested?has_content>aria-label="${nested}"</#if>>
    <#nested>
  </button>
</#macro>

<#macro loginButton>
  <@buttons.actionGroup>
    <@buttons.button id="kc-login" name="login" label="doLogIn" class=["kcButtonPrimaryClass", "kcButtonBlockClass"] />
  </@buttons.actionGroup>
</#macro>
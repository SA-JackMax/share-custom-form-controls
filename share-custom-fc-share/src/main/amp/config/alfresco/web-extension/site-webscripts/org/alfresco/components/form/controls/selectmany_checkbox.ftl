<#include "/org/alfresco/components/form/controls/common/utils.inc.ftl" />
<#if field.control.params.size??><#assign size=field.control.params.size><#else><#assign size=5></#if>

<#if field.control.params.optionSeparator??>
   <#assign optionSeparator=field.control.params.optionSeparator>
<#else>
   <#assign optionSeparator=",">
</#if>
<#if field.control.params.labelSeparator??>
   <#assign labelSeparator=field.control.params.labelSeparator>
<#else>
   <#assign labelSeparator="|">
</#if>
<!-- added logic operator -->
<#if field.control.params.logicOperator??>
   <#assign logicOperator=field.control.params.logicOperator?string>
<#else>
   <#assign logicOperator="AND">
</#if>

<#assign fieldValue=field.value>

<#if fieldValue?string == "" && field.control.params.defaultValueContextProperty??>
   <#if context.properties[field.control.params.defaultValueContextProperty]??>
      <#assign fieldValue = context.properties[field.control.params.defaultValueContextProperty]>
   <#elseif args[field.control.params.defaultValueContextProperty]??>
      <#assign fieldValue = args[field.control.params.defaultValueContextProperty]>
   </#if>
</#if>

<#if fieldValue?string != "">
   <#assign values=fieldValue?split(",")>
<#else>
   <#assign values=[]>
</#if>

<div class="form-field">
   <#if form.mode == "view">
      <div class="viewmode-field">
         <#if field.mandatory && !(fieldValue?is_number) && fieldValue?string == "">
            <span class="incomplete-warning"><img src="${url.context}/res/components/form/images/warning-16.png" title="${msg("form.field.incomplete")}" /><span>
         </#if>
         <span class="viewmode-label">${field.label?html}:</span>
         <#if fieldValue?string == "">
            <#assign valueToShow=msg("form.control.novalue")>
         <#else>
            <#if field.control.params.options?? && field.control.params.options != "" &&
                 field.control.params.options?index_of(labelSeparator) != -1>
                 <#assign valueToShow="">
                 <#assign firstLabel=true>
                 <#list field.control.params.options?split(optionSeparator) as nameValue>
                    <#assign choice=nameValue?split(labelSeparator)>
                    <#if isSelected(choice[0])>
                       <#if !firstLabel>
                          <#assign valueToShow=valueToShow+",">
                       <#else>
                          <#assign firstLabel=false>
                       </#if>
                       <#assign valueToShow=valueToShow+choice[1]>
                    </#if>
                 </#list>
            <#else>
               <#assign valueToShow=fieldValue>
            </#if>
         </#if>
         <span class="viewmode-value">${valueToShow?html}</span>
      </div>
   <#else>
      <label for="${fieldHtmlId}-entry">${field.label?html}:<#if field.mandatory><span class="mandatory-indicator">${msg("form.required.fields.marker")}</span></#if></label>
      <input id="${fieldHtmlId}" type="hidden" name="${field.name}" value="${fieldValue?string}" />
      <#if form.mode == "search">
         <input id="logic-operator-${fieldHtmlId}" type="hidden" name="logic-operator-${field.name}" value="${logicOperator}" />
      </#if>
      <#if field.control.params.options?? && field.control.params.options != "">
	<#assign my_index = 0/>		
	<#if field.control.params.border?? && field.control.params.border == "true"><fieldset style="width: 95%;padding: 0.2em;"></#if>
	<#if field.control.params.inline?? && field.control.params.inline == "true">
		<p>
		<#assign my_table = false/>
	<#else>
		<#assign my_table = true/>	
		<table style="width: 100% ! important; border-width:0px!important;" border="0" cellspacing="0" cellpadding="0">
	</#if>
	<#list field.control.params.options?split(optionSeparator) as nameValue>
		<#if my_table>
			<#if my_index == 0>
				<tr>
			</#if>
					<td style="vertical-align:top; border-style: none; border-width: 0px; color:#A3A3A4;" width="${100 / field.control.params.cols?number}%">
		</#if>
		<input id="${fieldHtmlId}-${nameValue?html}-entry" type="checkbox" name="${fieldHtmlId}-entry" value="${nameValue?html?split("|")[0]}"
<#if isSelected(nameValue?html?split("|")[0])> checked="checked"</#if>
onchange="javascript:document.getElementById('${fieldHtmlId}-entry').options[${nameValue_index}].selected=document.getElementById('${fieldHtmlId}-${nameValue?html}-entry').checked;Alfresco.util.updateMultiSelectListValue('${fieldHtmlId}-entry', '${fieldHtmlId}', <#if field.mandatory>true<#else>false</#if>);"/>&nbsp;${nameValue?html?split("|")[0]}
<#if field.control.params.inline?? && field.control.params.inline == "true">&nbsp;&nbsp;&nbsp;&nbsp;</#if>
		<#if my_table>
					</td>
			<#assign my_index = my_index + 1/>	
			<#if !field.control.params.cols?? || my_index == field.control.params.cols?number>
				</tr>
				<#assign my_index = 0/>
			</#if>
		</#if>
	</#list>
	<#if my_table>
		</table>
	<#else>
		</p>
	</#if>
	<#if field.control.params.border?? && field.control.params.border == "true"></fieldset></#if>
         <select style="display:none;" id="${fieldHtmlId}-entry" name="-" multiple="multiple" size="${size}" tabindex="0"
               <#if field.description??>title="${field.description}"</#if> 
               <#if field.control.params.styleClass??>class="${field.control.params.styleClass}"</#if>
               <#if field.control.params.style??>style="${field.control.params.style}"</#if>
               <#if field.disabled && !(field.control.params.forceEditable?? && field.control.params.forceEditable == "true")>disabled="true"</#if>>
               <#list field.control.params.options?split(optionSeparator) as nameValue>
                  <#if nameValue?index_of(labelSeparator) == -1>
                     <option value="${nameValue?html}"<#if isSelected(nameValue)> selected="selected"</#if>>${nameValue?html}</option>
                  <#else>
                     <#assign choice=nameValue?split(labelSeparator)>
                     <option value="${choice[0]?html}"<#if isSelected(choice[0])> selected="selected"</#if>>${msgValue(choice[1])?html}</option>
                  </#if>
               </#list>
         </select>
         <@formLib.renderFieldHelp field=field />
      <#else>
         <div id="${fieldHtmlId}" class="missing-options">${msg("form.control.selectone.missing-options")}</div>
      </#if>
   </#if>
</div>

<#function isSelected optionValue>
   <#list values as value>
      <#if optionValue == value?string || (value?is_number && value?c == optionValue)>
         <#return true>
      </#if>
   </#list>
   <#return false>
</#function>


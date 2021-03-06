{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}
{strip}
	{assign var="FIELD_INFO" value=\App\Purifier::encodeHtml(\App\Json::encode($FIELD_MODEL->getFieldInfo()))}
	{assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}
	{assign var="FIELD_NAME" value=$FIELD_MODEL->getName()}
	{assign var=FIELD_VALUE value=$FIELD_MODEL->getEditViewDisplayValue($FIELD_MODEL->get('fieldvalue'),$RECORD)}
	{assign var=UNIQUE_ID value=10|mt_rand:20}
	<div class="tpl-Edit-Field-Text">
		{if $FIELD_MODEL->getUIType() eq '19' || $FIELD_MODEL->getUIType() eq '20' || $FIELD_MODEL->getUIType() eq '300' }
			{assign var="PARAMS" value=$FIELD_MODEL->getFieldParams()}
			<textarea name="{$FIELD_MODEL->getFieldName()}"
					  id="{$MODULE}_editView_fieldName_{$FIELD_NAME}_{$UNIQUE_ID}{if $FIELD_MODEL->getUIType() eq '300' && $smarty.post.view eq 'QuickCreateAjax'}_qc{/if}"
					  class="col-md-11 form-control {if $FIELD_MODEL->getUIType() eq '300'}js-editor{/if} {if $FIELD_MODEL->isNameField()}nameField{/if} {if !empty($PARAMS['class'])}{$PARAMS['class']}{/if}"
					  title="{\App\Language::translate($FIELD_MODEL->getFieldLabel())}"
					  data-validation-engine="validate[{if $FIELD_MODEL->isMandatory() eq true}required,{/if}funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
					  data-fieldinfo='{$FIELD_INFO}'
					  {if $FIELD_MODEL->getUIType() eq '300'}data-js="ckEditor"{/if}
					  {if !empty($SPECIAL_VALIDATOR)}data-validator={\App\Json::encode($SPECIAL_VALIDATOR)}{/if} {if $FIELD_MODEL->isEditableReadOnly()}readonly="readonly"{/if}>
				{$FIELD_VALUE}
		</textarea>
		{else}
			<textarea name="{$FIELD_MODEL->getFieldName()}" id="{$MODULE}_editView_fieldName_{$FIELD_NAME}"
					  class="form-control {if $FIELD_MODEL->isNameField()}nameField{/if}"
					  title="{\App\Language::translate($FIELD_MODEL->getFieldLabel())} "
					  data-validation-engine="validate[{if $FIELD_MODEL->isMandatory() eq true}required,{/if}funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
					  data-fieldinfo='{$FIELD_INFO}'
					  {if !empty($SPECIAL_VALIDATOR)}data-validator={\App\Json::encode($SPECIAL_VALIDATOR)}{/if} {if $FIELD_MODEL->isEditableReadOnly()}readonly="readonly"{/if}>
			{$FIELD_VALUE}
		</textarea>
		{/if}
	</div>
{/strip}

<?php

/**
 * Inventory TotalPrice Field Class.
 *
 * @copyright YetiForce Sp. z o.o
 * @license YetiForce Public License 3.0 (licenses/LicenseEN.txt or yetiforce.com)
 * @author Mariusz Krzaczkowski <m.krzaczkowski@yetiforce.com>
 */
class Vtiger_TotalPrice_InventoryField extends Vtiger_Basic_InventoryField
{
	protected $name = 'TotalPrice';
	protected $defaultLabel = 'LBL_TOTAL_PRICE';
	protected $defaultValue = 0;
	protected $columnName = 'total';
	protected $dbType = 'decimal(28,8) DEFAULT 0';
	protected $summationValue = true;

	/**
	 * Getting value to display.
	 *
	 * @param type $value
	 *
	 * @return type
	 */
	public function getDisplayValue($value, $rawText = false)
	{
		return CurrencyField::convertToUserFormat($value, null, true);
	}

	/**
	 * {@inheritdoc}
	 */
	public function getValueFromRequest(&$insertData, \App\Request $request, $i)
	{
		$column = $this->getColumnName();
		if (empty($column) || $column === '-' || !$request->has($column . $i)) {
			return false;
		}
		$insertData[$column] = CurrencyField::convertToDBFormat($request->getByType($column . $i, 'NumberInUserFormat'), null, true);
	}
}

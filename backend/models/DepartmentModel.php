<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "tsi_departments".
 *
 * @property integer $department_id
 * @property integer $company_id
 * @property integer $dtype_id
 * @property string $department_name
 * @property string $department_code
 * @property integer $is_used
 * @property integer $department_tags
 * @property integer $department_p_id
 * @property string $level_key
 * @property integer $region_id
 * @property string $office_address
 * @property string $office_tel
 * @property string $contacts
 * @property string $contacts_tel
 *
 * @property TciRegions $region
 * @property TstDepartment $dtype
 */
class DepartmentModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tsi_departments';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['company_id', 'dtype_id', 'department_name', 'is_used', 'department_tags', 'level_key'], 'required'],
            [['company_id', 'dtype_id', 'is_used', 'department_tags', 'department_p_id', 'region_id'], 'integer'],
            [['department_name'], 'string', 'max' => 64],
            [['department_code', 'office_tel', 'contacts_tel'], 'string', 'max' => 32],
            [['level_key', 'office_address'], 'string', 'max' => 255],
            [['contacts'], 'string', 'max' => 16],
            [['company_id', 'department_name'], 'unique', 'targetAttribute' => ['company_id', 'department_name'], 'message' => 'The combination of Company ID and Department Name has already been taken.'],
            [['region_id'], 'exist', 'skipOnError' => true, 'targetClass' => TciRegions::className(), 'targetAttribute' => ['region_id' => 'region_id']],
            [['dtype_id'], 'exist', 'skipOnError' => true, 'targetClass' => TstDepartment::className(), 'targetAttribute' => ['dtype_id' => 'dtype_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'department_id' => 'Department ID',
            'company_id' => 'Company ID',
            'dtype_id' => 'Dtype ID',
            'department_name' => 'Department Name',
            'department_code' => 'Department Code',
            'is_used' => 'Is Used',
            'department_tags' => 'Department Tags',
            'department_p_id' => 'Department P ID',
            'level_key' => 'Level Key',
            'region_id' => 'Region ID',
            'office_address' => 'Office Address',
            'office_tel' => 'Office Tel',
            'contacts' => 'Contacts',
            'contacts_tel' => 'Contacts Tel',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRegion()
    {
        return $this->hasOne(TciRegions::className(), ['region_id' => 'region_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDtype()
    {
        return $this->hasOne(TstDepartment::className(), ['dtype_id' => 'dtype_id']);
    }
}

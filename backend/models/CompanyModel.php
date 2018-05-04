<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use backend\models\CtypeModel;

/**
 * This is the model class for table "tsi_companies".
 *
 * @property integer $company_id
 * @property string $company_name
 * @property string $company_code
 * @property integer $ctype_id
 * @property integer $is_used
 * @property integer $company_p_id
 * @property string $level_key
 * @property integer $region_id
 * @property string $office_address
 * @property string $office_tel
 * @property string $contacts
 * @property string $contacts_tel
 * @property string $inner_code
 * @property integer $account_id
 * @property integer $create_uid
 * @property string $create_time
 *
 * @property TstCompany $ctype
 * @property CompanyModel $companyP
 * @property CompanyModel[] $companyModels
 */
class CompanyModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tsi_companies';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['company_name', 'company_code', 'ctype_id', 'is_used', 'level_key'], 'required'],
            [['ctype_id', 'is_used', 'company_p_id', 'region_id', 'account_id', 'create_uid'], 'integer'],
            [['create_time'], 'safe'],
            [['company_name'], 'string', 'max' => 64],
            [['company_code', 'office_tel', 'contacts_tel', 'inner_code'], 'string', 'max' => 32],
            [['level_key', 'office_address'], 'string', 'max' => 255],
            [['contacts'], 'string', 'max' => 16],
            [['company_name'], 'unique'],
            [['company_code'], 'unique'],
            [['ctype_id'], 'exist', 'skipOnError' => true, 'targetClass' => TstCompany::className(), 'targetAttribute' => ['ctype_id' => 'ctype_id']],
            [['company_p_id'], 'exist', 'skipOnError' => true, 'targetClass' => CompanyModel::className(), 'targetAttribute' => ['company_p_id' => 'company_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'company_id' => 'Company ID',
            'company_name' => 'Company Name',
            'company_code' => 'Company Code',
            'ctype_id' => 'Ctype ID',
            'is_used' => 'Is Used',
            'company_p_id' => 'Company P ID',
            'level_key' => 'Level Key',
            'region_id' => 'Region ID',
            'office_address' => 'Office Address',
            'office_tel' => 'Office Tel',
            'contacts' => 'Contacts',
            'contacts_tel' => 'Contacts Tel',
            'inner_code' => 'Inner Code',
            'account_id' => 'Account ID',
            'create_uid' => 'Create Uid',
            'create_time' => 'Create Time',
        ];
    }

     /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanytree()
    {
        $treeList = Yii::$app->db->createCommand('
                    SELECT concat(c.company_name, "-",c.company_code) cName,
						   c.company_p_id cPId,
						   c.company_id cId,
                            IF(c.ctype_id = 1,1,0) pcTags,
                           c.level_key levelKey,
                           c.ctype_id ctypeId,
						   c.office_address officeAddress,
						   c.office_tel officeTel,
						   c.contacts contacts,
						   c.contacts_tel contactsTel,
						   c.is_used isUsed,
						   c.region_id regionId,
						   r.full_name regionName
					  FROM tsi_companies c,
					       tci_regions r
                     WHERE c.region_id = r.region_id
                    ')->queryAll();

        return $treeList;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCtype()
    {
        return $this->hasOne(TstCompany::className(), ['ctype_id' => 'ctype_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanyP()
    {
        return $this->hasOne(CompanyModel::className(), ['company_id' => 'company_p_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompanyModels()
    {
        return $this->hasMany(CompanyModel::className(), ['company_p_id' => 'company_id']);
    }
}

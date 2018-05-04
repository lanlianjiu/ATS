<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "tci_regions".
 *
 * @property integer $region_id
 * @property integer $country_id
 * @property string $region_code
 * @property integer $region_tags
 * @property string $region_name
 * @property string $center_longitude
 * @property string $center_latitude
 * @property string $region_pinyin
 * @property integer $is_used
 * @property integer $region_p_id
 * @property string $level_key
 * @property string $full_name
 * @property string $full_pinyin
 * @property string $short_name
 * @property string $short_pinyin
 * @property string $alias_name
 * @property string $alias_pinyin
 * @property string $province_abbr
 * @property string $area_code
 * @property integer $cpn_tags
 *
 * @property RegionsModel $regionP
 * @property RegionsModel[] $regionsModels
 */
class RegionsModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tci_regions';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['country_id', 'region_tags', 'region_name', 'is_used', 'level_key'], 'required'],
            [['country_id', 'region_tags', 'is_used', 'region_p_id', 'cpn_tags'], 'integer'],
            [['center_longitude', 'center_latitude'], 'number'],
            [['region_code', 'short_name', 'province_abbr', 'area_code'], 'string', 'max' => 32],
            [['region_name', 'region_pinyin', 'short_pinyin'], 'string', 'max' => 64],
            [['level_key'], 'string', 'max' => 255],
            [['full_name', 'full_pinyin', 'alias_name', 'alias_pinyin'], 'string', 'max' => 128],
            [['region_p_id', 'region_name'], 'unique', 'targetAttribute' => ['region_p_id', 'region_name'], 'message' => 'The combination of Region Name and Region P ID has already been taken.'],
            [['region_p_id'], 'exist', 'skipOnError' => true, 'targetClass' => RegionsModel::className(), 'targetAttribute' => ['region_p_id' => 'region_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'region_id' => 'Region ID',
            'country_id' => 'Country ID',
            'region_code' => 'Region Code',
            'region_tags' => 'Region Tags',
            'region_name' => 'Region Name',
            'center_longitude' => 'Center Longitude',
            'center_latitude' => 'Center Latitude',
            'region_pinyin' => 'Region Pinyin',
            'is_used' => 'Is Used',
            'region_p_id' => 'Region P ID',
            'level_key' => 'Level Key',
            'full_name' => 'Full Name',
            'full_pinyin' => 'Full Pinyin',
            'short_name' => 'Short Name',
            'short_pinyin' => 'Short Pinyin',
            'alias_name' => 'Alias Name',
            'alias_pinyin' => 'Alias Pinyin',
            'province_abbr' => 'Province Abbr',
            'area_code' => 'Area Code',
            'cpn_tags' => 'Cpn Tags',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAllregion()
    {
        $allregion = Yii::$app->db->createCommand('
            SELECT 
                region_id regionId,
                region_name regionName
              FROM tci_regions
              ORDER BY region_id ASC')->queryAll();
              $arr = array();
              foreach ($allregion as $key) {
                  $arr[$key['regionId']] = $key['regionName'];
              };
        return $arr;
    }

     /**
     * @return \yii\db\ActiveQuery
     */
    public function getCitylist($params)
    {
        
        $allregion = Yii::$app->db->createCommand('
        SELECT 
            region_id regionId,
            region_name regionName
        FROM tci_regions
        WHERE (region_tags&2)>0
        ORDER BY region_id ASC')->queryAll();
        return  $allregion;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRegionP()
    {
        return $this->hasOne(RegionsModel::className(), ['region_id' => 'region_p_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRegionsModels()
    {
        return $this->hasMany(RegionsModel::className(), ['region_p_id' => 'region_id']);
    }
}

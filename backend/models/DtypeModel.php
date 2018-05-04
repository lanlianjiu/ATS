<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "tst_department".
 *
 * @property integer $dtype_id
 * @property string $dtype_name
 * @property integer $is_used
 *
 * @property TsiDepartments[] $tsiDepartments
 */
class DtypeModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tst_department';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['dtype_id', 'dtype_name', 'is_used'], 'required'],
            [['dtype_id', 'is_used'], 'integer'],
            [['dtype_name'], 'string', 'max' => 32],
            [['dtype_name'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'dtype_id' => 'Dtype ID',
            'dtype_name' => 'Dtype Name',
            'is_used' => 'Is Used',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTsiDepartments()
    {
        return $this->hasMany(TsiDepartments::className(), ['dtype_id' => 'dtype_id']);
    }
}

<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "tst_company".
 *
 * @property integer $ctype_id
 * @property string $ctype_name
 * @property integer $is_used
 * @property integer $system_id
 * @property integer $role_id
 */
class CtypeModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'tst_company';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ctype_id', 'ctype_name', 'is_used'], 'required'],
            [['ctype_id', 'is_used', 'system_id', 'role_id'], 'integer'],
            [['ctype_name'], 'string', 'max' => 32],
            [['ctype_name'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ctype_id' => 'Ctype ID',
            'ctype_name' => 'Ctype Name',
            'is_used' => 'Is Used',
            'system_id' => 'System ID',
            'role_id' => 'Role ID',
        ];
    }

     /**
     * @return \yii\db\ActiveQuery
     */
    public function getCtypes()
    {
        $ctypeList = Yii::$app->db->createCommand('
                    SELECT ctype_id ctypeId,
                           ctype_name ctypeName
					  FROM tst_company 
                     WHERE is_used = 1
                    ')->queryAll();

        return $ctypeList;
    }
}

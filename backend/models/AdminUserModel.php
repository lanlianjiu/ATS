<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use common\models\adminModel;

/**
 * This is the model class for table "admin_user".
 *
 * @property integer $id
 * @property string $username
 * @property string $auth_key
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $email_vaidate_token
 * @property string $email
 * @property integer $role
 * @property integer $status
 * @property string $avator
 * @property integer $vip_1v
 * @property integer $created_at
 * @property integer $updated_at
 */
class AdminUserModel extends \yii\db\ActiveRecord
{
    public $username;
    public $email;
    public $password;
    public $usermobile;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'admin_user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'auth_key', 'password_hash', 'email', 'role', 'status', 'created_at', 'updated_at'], 'required'],
            [['role', 'status', 'vip_1v', 'created_at', 'updated_at','user_mobile'], 'integer'],
            [['username', 'password_hash', 'email', 'avator'], 'string', 'max' => 255],
            [['auth_key', 'password_reset_token', 'email_vaidate_token'], 'string', 'max' => 45],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'auth_key' => 'Auth Key',
            'user_mobile'=>'usermobile',
            'password_hash' => 'Password Hash',
            'password_reset_token' => 'Password Reset Token',
            'email_vaidate_token' => 'Email Vaidate Token',
            'email' => 'Email',
            'role' => 'Role',
            'status' => 'Status',
            'avator' => 'Avator',
            'vip_1v' => 'Vip 1v',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

     /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserList()
    {
        $userList = Yii::$app->db->createCommand('
            SELECT 
                id id,
                username username,
                status status,
                vip_1v vip,
                email email,
                created_at createdTime,
                role role
              FROM admin_user')->queryAll();

        return $userList;
    }

    /**
     * create user up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function create()
    {
        if (!$this->validate()) {
            return null;
        }
        
        $user = new adminModel();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->usermobile = $this->usermobile;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        
        return $user->save() ? $user : null;
    }
   
}

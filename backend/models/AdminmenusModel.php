<?php

namespace backend\models;

use Yii;
use yii\base\Model;


/**
 * This is the model class for table "admin_menus".
 *
 * @property integer $menu_id
 * @property integer $system_id
 * @property string $menu_name
 * @property string $menu_dname
 * @property string $menu_icon
 * @property string $menu_url
 * @property string $help_url
 * @property integer $menu_p_id
 * @property integer $is_used
 * @property integer $menu_tags
 * @property integer $menu_order
 * @property integer $new_window_opened
 */
class AdminmenusModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'admin_menus';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['menu_id', 'system_id', 'menu_name', 'menu_dname', 'is_used', 'menu_tags', 'menu_order', 'new_window_opened'], 'required'],
            [['menu_id', 'system_id', 'menu_p_id', 'is_used', 'menu_tags', 'menu_order', 'new_window_opened'], 'integer'],
            [['menu_name', 'menu_dname'], 'string', 'max' => 64],
            [['menu_icon', 'menu_url', 'help_url'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'menu_id' => 'Menu ID',
            'system_id' => 'System ID',
            'menu_name' => 'Menu Name',
            'menu_dname' => 'Menu Dname',
            'menu_icon' => 'Menu Icon',
            'menu_url' => 'Menu Url',
            'help_url' => 'Help Url',
            'menu_p_id' => 'Menu P ID',
            'is_used' => 'Is Used',
            'menu_tags' => 'Menu Tags',
            'menu_order' => 'Menu Order',
            'new_window_opened' => 'New Window Opened',
        ];
    }

     public function getMenulist()
    {
       $menuList = Yii::$app->db->createCommand('
         SELECT DISTINCT m.menu_id id,
						   m.menu_dname text,
                           m.menu_dname title,
						   m.menu_id tabs,
						   m.menu_url url,
						   m.help_url helpUrl,
						   IFNULL(m.menu_p_id,0) pId,
						   m.new_window_opened newWindowOpened,
						   m.menu_icon icon
                      FROM admin_menus m	
                     WHERE m.menu_id != 1
                     ORDER BY m.menu_p_id, m.menu_order')->queryAll();
        return $menuList;
    }
}

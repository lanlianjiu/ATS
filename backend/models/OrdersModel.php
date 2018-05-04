<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "mca_orders".
 *
 * @property integer $order_id
 * @property string $order_no
 * @property integer $order_status
 * @property integer $order_type_id
 * @property integer $comany_id
 * @property integer $department_id
 * @property integer $goods_id
 * @property string $order_addr
 * @property integer $order_addr_id
 * @property string $order_amont
 * @property string $create_time
 * @property integer $create_uid
 * @property string $update_date
 * @property integer $update_uid
 *
 * @property OrderType $orderType
 */
class OrdersModel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'mca_orders';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_no', 'comany_id', 'department_id', 'goods_id', 'order_addr_id', 'create_time', 'create_uid'], 'required'],
            [['order_status', 'order_type_id', 'comany_id', 'department_id', 'goods_id', 'order_addr_id', 'create_uid', 'update_uid'], 'integer'],
            [['create_time'], 'safe'],
            [['order_no', 'order_addr', 'order_amont'], 'string', 'max' => 20],
            [['update_date'], 'string', 'max' => 255],
            [['order_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrderType::className(), 'targetAttribute' => ['order_type_id' => 'order_type_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'order_id' => 'Order ID',
            'order_no' => 'Order No',
            'order_status' => 'Order Status',
            'order_type_id' => 'Order Type ID',
            'comany_id' => 'Comany ID',
            'department_id' => 'Department ID',
            'goods_id' => 'Goods ID',
            'order_addr' => 'Order Addr',
            'order_addr_id' => 'Order Addr ID',
            'order_amont' => 'Order Amont',
            'create_time' => 'Create Time',
            'create_uid' => 'Create Uid',
            'update_date' => 'Update Date',
            'update_uid' => 'Update Uid',
        ];
    }

     /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderlist($params)
    {

        $whereArray = [
            'order_no' => isset($params['orderNo'])?(trim($params['orderNo'])):"",
            'order_status' => isset($params['orderStatus'])?(trim($params['orderStatus'])):"",
        ];
       
        $orderList = (new \yii\db\Query())
                     ->select("  comany_id comanyId,
                                create_time createTime,
                                create_uid createUid,
                                department_id departmentId,
                                goods_id goodsId,
                                order_addr orderAddr,
                                order_addr_id orderAddrId,
                                order_amont orderAmont,
                                order_id orderId,
                                order_no orderNo,
                                order_status orderStatus,
                                order_type_id orderTypeId,
                                update_date updateDate,
                                update_uid  updateUid"
                        )->from("mca_orders")
                        ->andFilterWhere($whereArray)
                         ->all();

        return $orderList;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderType()
    {
        return $this->hasOne(OrderType::className(), ['order_type_id' => 'order_type_id']);
    }
}

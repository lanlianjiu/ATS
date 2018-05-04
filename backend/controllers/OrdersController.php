<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\base\BaseModel;
use backend\models\OrdersModel;

class OrdersController extends Controller
{
    public function actionIndex()
    {
                       
        $basemodel = new BaseModel(); 
        $model = new OrdersModel();
        $params = Yii::$app->request->get();
        $orderList = $model->getOrderlist($params);
        return $basemodel->resultMap(true,$orderList);
    }

    public function actionCreate()
    {
        $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
        $orderSn = $yCode[intval(date('Y')) - 2011] . strtoupper(dechex(date('m'))) . date('d') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%02d', rand(0, 99));

        $basemodel = new BaseModel();

        $model = new OrdersModel();
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            
            return $basemodel->resultMap(true);
        } else {

            return $basemodel->resultMap(false);
        }
    }

}

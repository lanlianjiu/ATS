<?php

namespace backend\controllers;
use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\base\BaseModel;
use common\models\adminModel;
use backend\models\AdminUserModel;

class AdminuserController extends \yii\web\Controller
{
    public function actionIndex()
    {
        $basemodel = new BaseModel();
        $model = new AdminUserModel();
        $result = $model->getUserList();
        return $basemodel->resultMap(true,$result);
    }

    


    public function actionCreate()
    {
        $basemodel = new BaseModel();
        $model = new AdminUserModel();
       
        if ($model->load(Yii::$app->request->post(),'') && $model->create()) {

            return $basemodel->resultMap(true,null,"添加成功!");
        } else {
            
            return $basemodel->resultMap(false,null,"添加失败!");
        }
    }

}

<?php

namespace backend\controllers;
use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\base\BaseModel;
use backend\models\CompanyModel;
use backend\models\CtypeModel;

class CompanyController extends \yii\web\Controller
{
    public function actionIndex()
    {   
        $basemodel = new BaseModel();
        $model = new CompanyModel();
        $result = $model->getCompanytree();
        return $basemodel->resultMap(true,$result);
    }

     public function actionCtype()
    {   
        $basemodel = new BaseModel();
        $model = new CtypeModel();
        $result = $model->getCtypes();
        return $basemodel->resultMap(true,$result);
    }

}

<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\base\BaseModel;
use backend\models\LoginForm;
use backend\models\AdminmenusModel;

/**
 * Site controller
 */
class SiteController extends Controller
{
    
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }


    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
       
         $basemodel = new BaseModel();
         $model = new AdminmenusModel();
         $result = $model->getMenulist();
                       
       return $basemodel->resultMap(true,$result);
    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        $basemodel = new BaseModel();   

        if (!Yii::$app->user->isGuest) {
            $result = [
            'result' => ['username'=>Yii::$app->user->identity->username], 
            'status' => true,
               'msg' => ''
            ];
             return $basemodel->resultMap(true,$result);
        }
       
        $model = new LoginForm();
         
        if ($model->load(Yii::$app->request->post(),'') && $model->login()) {

            $result = [
            'result' => ['username'=>Yii::$app->user->identity->username], 
            'status' => true,
               'msg' => ''
            ];
           
            return $basemodel->resultMap(true,$result);
           

        } else {
           
            return $basemodel->resultMap(false);
        }
    }
    
    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();
        $basemodel = new BaseModel();   
        return $basemodel->resultMap(true);
    }
}

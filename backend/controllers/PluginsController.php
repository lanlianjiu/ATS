<?php

namespace backend\controllers;
use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\base\BaseModel;
use backend\models\RegionsModel;
class PluginsController extends \yii\web\Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionRegion()
    {
        $basemodel = new BaseModel();

         $province = Yii::$app->db->createCommand('
            SELECT 
                region_id regionId,
                region_name regionName,
                region_tags regionTags,
                region_p_id regionPId
              FROM tci_regions
              WHERE (region_tags&1)>0')->queryAll();

        $city = Yii::$app->db->createCommand('
            SELECT 
                region_id regionId,
                region_name regionName,
                region_tags regionTags,
                region_p_id regionPId
              FROM tci_regions
              WHERE (region_tags&2)>0')->queryAll();

        $country = Yii::$app->db->createCommand('
            SELECT 
                region_id regionId,
                region_name regionName,
                region_tags regionTags,
                region_p_id regionPId
              FROM tci_regions
              WHERE (region_tags&4)>0')->queryAll();

        $street = Yii::$app->db->createCommand('
            SELECT 
                region_id regionId,
                region_name regionName,
                region_tags regionTags,
                region_p_id regionPId
              FROM tci_regions
              WHERE (region_tags&8)>0')->queryAll();


              $result = [
                1=>$province,
                2=>$city,
                4=>$country,
                8=>$street
              ];

        // $regionModel = new regionModel();
        // $result = $regionModel->search(Yii::$app->request->queryParams);

        return $basemodel->resultMap(true,$result);
    }

    public function actionRegionplugin()
    {
        $basemodel = new BaseModel();
        $model = new RegionsModel();
        $region = $model->getAllregion();
        return json_encode($region);
    }

    public function actionRegioncity()
    {
       
        $model = new RegionsModel();
        $params = Yii::$app->request->get();
        $region = $model->getCitylist($params);
        $result = [
            'msg' => "",
            'value' =>$region,

        ];
        return json_encode($result);
    }

}

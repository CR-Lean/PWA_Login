<?php

use yii\helpers\Url;
use yii\helpers\Html;

$this->title = "Mi Perfil";
$this->params['breadcrumbs'][] = $this->title;
?>

<h1 class="text-center"> Perfil: <?= Html::encode(Yii::$app->user->identity->username); ?> </h1>
<?php $model = Yii::$app->authManager->getRolesByUser(Yii::$app->user->identity->id);  ?>
<div class='row'>
    <div class="col-sm-10 col-md-4 mt-4">
        <div class="card">
            <img class="card-img" src="" title="<?= Html::encode(Yii::$app->user->identity->username); ?>">

            <div class="card-body">
                <table class="table table-hover">
                    <tbody>
                        <tr>
                          <th> Nombre: </td>
                          <td> <?= Html::encode(Yii::$app->user->identity->nombre); ?> </td>
                        </tr>

                        <tr>
                          <th> Apellido: </td>
                          <td> <?= Html::encode(Yii::$app->user->identity->apellido); ?> </td>
                        </tr>
                        <tr>
                          <th> Email: </td>
                          <td> <?= Html::encode(Yii::$app->user->identity->email); ?> </td>
                        </tr>
                        <th> Roles: </td>
                        <?php foreach ($model as $rol): ?>
                          <td><?= Html::encode("{$rol->name}")?></th>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!--<a href="<?= Url::toRoute(['club/listarposicionesclub']); ?>">Volver</a>-->

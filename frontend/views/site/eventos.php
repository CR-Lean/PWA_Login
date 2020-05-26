<?php

use yii\helpers\Url;
use yii\helpers\Html;

$this->title = "Listado de eventos";
$this->params['breadcrumbs'][] = $this->title;
?>
<h1 class="text-center mb-4"> <?= Html::encode($this->title); ?> </h1>

<?php
//Verificamos que el usuario esté registrado como organizador
if (Yii::$app->user->can('organizador')) {
    ?>
    <a href="" class="btn btn-secondary" role="button"> Crear Evento </a>
    <?php
}
?>

<div id="info-club">
    <div class='row'>
        <?php
        foreach ($data as $unEvento):
            ?>
            <div class="col-sm-4">
                <!-- Inicio Panel Evento-->
                <div class="panel panel-info">
                    <div class="panel-heading text-white">
                        <h5 class = "panel-title text-center"> <?= Html::encode("{$unEvento['titulo']}"); ?>: </h5>
                    </div>

                    <!-- Data Eventos -->
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col"> Organizador: </th>
                                    <th scope="col"> Descripcion: </th>
                                    <th scope="col"> Fecha: </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td> <?= Html::encode("{$unEvento['organizador']}");    ?>  </td>
                                    <td> <?= Html::encode("{$unEvento['descripcion']}"); ?> </td>
                                    <td> <?= Html::encode("{$unEvento['fecha']}"); ?> </td>
                                </tr>
                            </tbody>
                        </table>

                                    <!--<a href="<?php // echo Url::toRoute(['jugador/listarjugadoresclub', 'club' => $unaTupla['Club']]);    ?>" class="btn btn-secondary" role="button"> Mas Detalles... </a>-->
                    </div>
                    <!-- Data Eventos -->
                </div>
                <!-- Fin Panel Eventos-->
            </div>
        <?php endforeach; ?>
    </div>
</div>

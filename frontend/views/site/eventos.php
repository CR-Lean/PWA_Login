<?php

use yii\helpers\Url;
use yii\helpers\Html;

$this->title = "Listado de eventos";
$this->params['breadcrumbs'][] = $this->title;
?>
<h1 class="text-center mb-4"> <?= Html::encode($this->title); ?> </h1>

    <?php 
    if (Yii::$app->user->can('evento/create')) {
        ?>
            <a href="" class="btn btn-secondary" role="button"> Crear Evento </a>
        <?php
    }
    ?>

<div id="info-club">
    <div class='row'>
        <?php

//        foreach ($data as $unaTupla):
            ?>
            <div class="col-sm-4">
                <!-- Inicio Panel Evento-->
                <div class="panel panel-info">
                    <div class="panel-heading text-white">
                        <h5 class = "panel-title text-center"> <?= Html::encode("{ }"); ?>: </h5>
                    </div>

                    <!-- Data Eventos -->
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Posicion</th>
                                    <th scope="col text-center">Cantidad de Jugadores</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
//                                foreach ($unaTupla['DataClub'] as $datosClub):
                                    ?>
                                    <tr>
                                        <td> <?= Html::encode("{}"); ?> </td>
                                        <td class="text-center"> <?= Html::encode("{}"); ?> </td>
                                    </tr>
                                <?php // endforeach; ?>
                            </tbody>
                        </table>

                        <!--<a href="<?php // echo Url::toRoute(['jugador/listarjugadoresclub', 'club' => $unaTupla['Club']]); ?>" class="btn btn-secondary" role="button"> Mas Detalles... </a>-->
                    </div>
                    <!-- Data Eventos -->
                </div>
                <!-- Fin Panel Eventos-->
            </div>
        <?php // endforeach; ?>
    </div>
</div>

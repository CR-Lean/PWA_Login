<?php

/* @var $this yii\web\View */

$this->title = 'Backend - Juntar';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>Juntar</h1>

        <p class="lead">Aplicacion Backend</p>
<?php
if (Yii::$app->user->can('admin')) {
  echo '<h3>Ha iniciado como Administrador</h3>';
}

 ?>
    </div>

    <div class="body-content">

        <div class="row">

        </div>

    </div>
</div>

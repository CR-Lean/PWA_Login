<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "evento".
 *
 * @property int $idEvento
 * @property string $nombre
 * @property string $fecha
 * @property string $descripcion
 * @property int $idUser
 */
class Evento extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'evento';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'fecha', 'descripcion', 'idUser'], 'required'],
            [['fecha'], 'safe'],
            [['idUser'], 'integer'],
            [['nombre'], 'string', 'max' => 50],
            [['descripcion'], 'string', 'max' => 400],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'idEvento' => 'Id Evento',
            'nombre' => 'Nombre',
            'fecha' => 'Fecha',
            'descripcion' => 'Descripcion',
            'idUser' => 'Id User',
        ];
    }

    /**
     * {@inheritdoc}
     * @return EventoQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new EventoQuery(get_called_class());
    }
}

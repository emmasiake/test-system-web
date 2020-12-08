<?php

namespace backend\models;

use common\models\User;
use Yii;

/**
 * This is the model class for table "task".
 *
 * @property int $task_id
 * @property string $title
 * @property string $description
 * @property string $function_name
 * @property string $function_description
 * @property int $category_id
 * @property int $user_id
 * @property string $created_at
 *
 * @property User $user
 * @property Category $category
 */
class Task extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'task';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'description', 'function_name', 'function_description', 'category_id', 'user_id', 'created_at'], 'required'],
            [['description'], 'string'],
            [['category_id', 'user_id'], 'integer'],
            [['created_at'], 'safe'],
            [['title', 'function_name', 'function_description'], 'string', 'max' => 255],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Category::className(), 'targetAttribute' => ['category_id' => 'category_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'task_id' => 'Task ID',
            'title' => 'Title',
            'description' => 'Description',
            'function_name' => 'Function Name',
            'function_description' => 'Function Description',
            'category_id' => 'Category ID',
            'user_id' => 'User ID',
            'created_at' => 'Created At',
        ];
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * Gets query for [[Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Category::className(), ['category_id' => 'category_id']);
    }
}

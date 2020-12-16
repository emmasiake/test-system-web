<?php

namespace frontend\models;

use common\models\User;
use Yii;

/**
 * This is the model class for table "solution".
 *
 * @property int $solution_id
 * @property string $solution
 * @property int $task_id
 * @property int $user_id
 * @property int $test_result
 * @property float $result
 * @property string $created_at
 *
 * @property Task $task
 * @property User $user
 */
class Solution extends \yii\db\ActiveRecord
{
    public $testResultArray;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'solution';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['solution', 'task_id'], 'required'],
            [['solution'], 'string'],
            [['task_id'], 'integer'],
            [['task_id'], 'exist', 'skipOnError' => true, 'targetClass' => Task::className(), 'targetAttribute' => ['task_id' => 'task_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'solution_id' => 'Solution ID',
            'solution' => 'Solution',
            'task_id' => 'Task ID',
            'test_result' => 'Test Result',
            'result' => 'Result',
            'created_at' => 'Created At',
        ];
    }

    /**
     * Gets query for [[Task]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTask()
    {
        return $this->hasOne(Task::className(), ['task_id' => 'task_id']);
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

    public function beforeSave($insert)
    {
        if ($insert) {
            $this->user_id = Yii::$app->user->getId();
            $this->created_at = Date("Y-m-d h:i:s");
        }
        return parent::beforeSave($insert); // TODO: Change the autogenerated stub
    }

    public function generateTestResultArray()
    {
        $this->testResultArray = json_decode($this->test_result, true);
    }

    public function generateWrongResult() {
        $tests = json_decode($this->task->tests, true);
        $testResult = [];
        foreach($tests['args'] as $key => $item) {
            $testResult['results'][$key]['message'] = "Test failed";
            $testResult['results'][$key]['error']['message'] = "Error in code";
        }

        $testResult['result'] = 0;
        $this->test_result = json_encode($testResult);

    }
}

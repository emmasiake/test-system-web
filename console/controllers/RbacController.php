<?php
namespace console\controllers;

use common\rbac\AuthorRule;
use Yii;
use yii\console\Controller;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = Yii::$app->authManager;
        $auth->removeAll();

        // add "createTask" permission
        $createTask = $auth->createPermission('createTask');
        $createTask->description = 'Create a task';
        $auth->add($createTask);

        // add "updateTask" permission
        $updateTask = $auth->createPermission('updateTask');
        $updateTask->description = 'Update task';
        $auth->add($updateTask);

        // add "deleteTask" permission
        $deleteTask = $auth->createPermission('deleteTask');
        $updateTask->description = 'Delete task';
        $auth->add($deleteTask);

        // add "author" role and give this role the "createPost" permission
        $authUser = $auth->createRole('authUser');
        $moderator = $auth->createRole('moderator');
        $admin = $auth->createRole('admin');
        $auth->add($authUser);
        $auth->add($moderator);
        $auth->add($admin);

        $auth->addChild($authUser, $createTask);
        $auth->addChild($moderator, $updateTask);
        $auth->addChild($admin, $deleteTask);

        $auth->addChild($moderator, $authUser);
        $auth->addChild($admin, $moderator);

        // Assign roles to users. 1 and 2 are IDs returned by IdentityInterface::getId()
        // usually implemented in your User model.
        $auth->assign($admin, 1);
        $auth->assign($moderator, 2);
        $auth->assign($authUser, 3);
    }

    public function actionAuthorRule()
    {
        $auth = Yii::$app->authManager;
        $rule = new AuthorRule;
        $auth->add($rule);

        $updateOwnTask = $auth->createPermission('updateOwnTask');
        $updateOwnTask->description = 'Update own task';
        $updateOwnTask->ruleName = $rule->name;
        $auth->add($updateOwnTask);

        $updateTask = $auth->getPermission("updateTask");
        $auth->addChild($updateOwnTask, $updateTask);

        $moderator = $auth->getRole("moderator");
        $auth->addChild($moderator, $updateOwnTask);
    }
}
<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  权限管理
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年8月4日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Admin\Controller;
    use Admin\Controller\InitController;
    use Library\Rbac;

    class RbacController extends InitController{
        private $rbac;
        function _init(){
            $this->rbac = new Rbac();
        }

        function index(){

        }

        function edit(){
            $type = $_REQUEST['type'];
            switch ($type){
                case 'user':
                    $template = 'useredit';
                    break;
            }
        }
    }
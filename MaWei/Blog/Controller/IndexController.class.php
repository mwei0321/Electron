<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain: blog 主页
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年7月19日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Blog\Controller;
    use Blog\Controller\InitController;


    class IndexController extends InitController{
        private $Article;
        function _init(){
            parent::_init();
        }

        function index(){

        }
    }
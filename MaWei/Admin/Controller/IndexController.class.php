<?php
  /**
	*  +---------------------------------------------------------------------------------+
	*   | Explain:  后台管理首页
	*  +---------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +---------------------------------------------------------------------------------+
	*   | Creater Time : 2016年6月2日
	*  +---------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +---------------------------------------------------------------------------------+
	**/

    namespace Admin\Controller;

	class IndexController extends InitController{

	    function _init(){
	        parent::_init();
	    }

	    function index(){
	        $this->display();
	    }
	}
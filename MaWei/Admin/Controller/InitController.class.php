<?php

  /**
	*  +---------------------------------------------------------------------------------+
	*   | Explain:  后台管理模板初始入口
	*  +---------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +---------------------------------------------------------------------------------+
	*   | Creater Time : 2016年6月2日
	*  +---------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +---------------------------------------------------------------------------------+
	**/
    namespace Admin\Controller;
	use Think\Controller;

	class InitController extends Controller{

	    function _init(){

	        //init菜单
	        $this->initMenu();
	    }



	    /**
	     * 菜单设置
	     * @return array
	     * @author MaWei (http://www.phpyrb.com)
	     * @date 2014-8-13 下午12:24:24
	     */
	    private function initMenu(){
			$AdminNavMenu = new \Library\AdminNaviMenu();

			$naviMenu = $AdminNavMenu->getAdminNaviMenu(['status'=>1]);
			$naviMenu = getTree($naviMenu);
			$naviMenu = fieldtokey($naviMenu,'key');
// 			var_dump($naviMenu);

// 	        $NavMenu = array(
// 	            'topmenu' => array(
// 	                'System' => array('系统设置',U('Admin/System/index'))
// 	            ),
// 	            'leftmenu' => array(
// 	                'System' => array(
// 	                    array('系统设置',U('Admin/System/index'),'index'),
// 	                    array('后台菜单设置',U('Admin/System/adminmenu'),'adminmenu'),
// 	                )
// 	            )
// 	        );
	        $this->assign('naviMenu',$naviMenu);
	    }
	}
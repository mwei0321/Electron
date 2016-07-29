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
	    //ajax返回定义
	    protected $reCode = 200;
	    protected $msg      =   'operate success!';
	    protected $emsg     =   'operate error!';
	    protected $restatus =   1;

	    function _init(){

	        //init菜单
	        $this->initMenu();

	        //template style
	        $theme = ['live','beauty','default'];
	        $_REQUEST['style'] && C('DEFAULT_THEME',$theme[intval($_REQUEST['style'])]);
	        //status
	        $this->assign('status',['关闭','开启']);
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
			$naviMenu = getTree($naviMenu,2,'key');

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

	    /**
	     * ajax接口返回
	     * @param  array $_data 数据
	     * @return array
	     * @author MaWei (http://www.phpython.com)
	     * @date 2016年7月26日 上午11:10:33
	     */
	    protected function _reCode($_data = []){
	        $data = [];
	        $data['reCode']       =   $this->reCode;
	        $data['msg']        =   $this->msg;
	        $data['emsg']       =   $this->emsg;
	        $data['restatus']   =   $this->restatus;
	        $data['data']       =   $_data;
	        echo json_encode($data);
	        exit;
	    }
	}
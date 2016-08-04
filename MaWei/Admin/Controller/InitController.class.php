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
	use Library\AdminNaviMenu;

	class InitController extends Controller{
	    //ajax返回定义
	    protected $reCode   =   200;
	    protected $msg      =   '';
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
			$AdminNavMenu = new AdminNaviMenu();

			$naviMenu = $AdminNavMenu->getAdminNaviMenu(['status'=>1]);
			//树型化
			$naviMenu = getTree($naviMenu,2,'key');
            //
			$naviMenu = fieldtokey($naviMenu,'key');

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
	        $data['msg']        =   $this->msg ? : $this->_reCodeMsg();
	        $data['restatus']   =   $this->restatus;
	        $data['data']       =   $_data;
	        echo json_encode($data);
	        exit;
	    }

	    /**
	     * define return status code
	     * @return array
	     * @author MaWei (http://www.phpython.com)
	     * @date 2015年6月12日  上午9:54:55
	     */
	    private function _reCodeMsg(){
	        $recode = [
    	        // 2xx status code
    	        '200' => 'success', //成功
    	        '204' => 'service access success,but no data', //访问成功，但没有数据

    	        // 4xx status code
    	        '400' => 'error request', //错误请求,服务器不理解请求的语法
    	        '401' => 'no access', //（未授权） 请求要求身份验证。 对于需要登录的网页，服务器可能返回此响应。
    	        '403' => 'service reject request', //服务器拒绝请求。
    	        '404' => 'no find page', //服务器没有找到指定页面。
    	        '405' => 'request method error', //禁用请求中指定的方法。
    	        '408' => 'request over time', //请求超时
    	        '410' => 'request source delete', //请求的资源已永久删除

    	        '430' => 'data add or updata or delete fail', //数据添加，更新失败
    	        '440' => 'request param error', //请求参数错误

    	        //5xx status code
    	        '500' => 'server error', //服务器内部错误

    	        //7xx status code
	       ];
	       return $recode[$this->reCode];
	    }
	}
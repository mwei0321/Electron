<?php
	/**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  系统设置
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: ONLY <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2014-8-3
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :  http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

	namespace Admin\Controller;
	use Admin\Controller\InitController;
	use Library\AdminNaviMenu;

	class SystemController extends InitController{
		protected $app,$System;
		function _init(){
			parent::_init();

			$this->assign('position',['顶级','二级']);
			$this->System = new AdminNaviMenu();
		}

		function index(){
			$this->display();
		}

		/**
		* 后台菜单设置
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-10-5  上午10:53:46
		*/
		function menu(){
			$menu = $this->System->getAdminNaviMenu();
			$this->assign('list',$menu);
			$this->display();
		}

		/**
		* 添加，修改编辑页
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-9-8  下午1:17:32
		*/
		function edit(){
			$type = $_REQUEST['type'] ? text($_REQUEST['type']) : exit(null);
			$id = intval($_REQUEST['id']);
			$info = $pmenu = [];
			$template = null;
			switch ($type){
				case 'AdminMenu':
					if($id){
						$info = $this->System->getMenuInfo($id);
					}
					$pmenu = $this->System->getAdminNaviMenu(['position'=>0,'status'=>1]);
					$template = 'menuedit';
					$this->assign('pmenu',$pmenu);
					break;
				default:
					exit();
			}
			$this->assign('type',$type);
			$this->assign('info',$info);
			$this->display($template);
		}

		/**
		* 删除操作
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-9-7  下午10:38:57
		*/
		function delete(){
			$type = $_REQUEST['type'] ? text($_REQUEST['type']) : exit(null);
			$_ids = intval($_REQUEST['ids']);
			switch ($type) {
				case 'AdminMenu' :
					$reid = delall($_ids, 'AdminNaviMenu');
					if($reid === false){
						echo null;
					}else{
						echo 1;
					}
					break;
			}
		}

		/**
		 * 已安装APP列表
		 * @author MaWei (http://www.phpyrb.com)
		 * @date 2014-10-8 下午4:52:13
		 */
		function installapp(){
			$list = $this->app->getAppList();
			$this->assign('list',$list);
			$this->display();
		}

		/**
		 * 未安装APP列表
		 * @author MaWei (http://www.phpyrb.com)
		 * @date 2014-10-8 下午4:52:31
		 */
		function uninstallapp(){

		}

		/**
		* 更新到数据库操作
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-9-7  下午8:47:33
		*/
		function addupdata(){
			$type = $_REQUEST['type'] ? text($_REQUEST['type']) : exit(null);
			$data = array();
			$_REQUEST['id'] && $id = $data['id'] = intval($_REQUEST['id']);
			$reid = $url = false;
			switch ($type) {
				case 'AdminMenu' :
					$data['pid'] = intval($_REQUEST['pid']);
					$data['name'] = text($_REQUEST['name']);
					$data['key'] = text($_REQUEST['key']);
					$data['position'] = $data['pid'] == 0 ? 0 : 1;
// 					$data['position'] = intval($_REQUEST['position']);
					$data['sort'] = intval($_REQUEST['sort']);
					$data['action'] = text($_REQUEST['action']);
					$data['url'] = $_REQUEST['url'];
					$data['status'] = $_REQUEST['status'] ? intval($_REQUEST['status']) : 1;
					$reid = addUpdata($data,'AdminNaviMenu');
					S('Menu',null);
					break;
				default:
					exit();
			}

			//return
			$this->_reCode();
		}
	}
<?php
	/**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  分类、标签
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: ONLY <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2014-5-23 	
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpyrb.com	     
	*  +----------------------------------------------------------------------------------------------+
	**/

	namespace Admin\Controller;
	use Admin\Controller\IniController;
	use Pub\Page;
		
	class CateTagController extends IniController{
		function _initialize(){
			parent::_initialize();
			import('Pub\Page');
			$this->assign('view','catetag');
		}
		
		/**
		* 分类列表
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-5-23  下午10:14:08
		*/
		function index(){
// 			dump(S('CateList'));
			$count = count(S('CateList'));
// 			dump($count);exit;
			$cpage = new Page($count, 25);
			$cate = array_slice(S('CateList'), $cpage->firstRow,$cpage->listRows);
			$this->assign('cate',$cate);
			$this->assign('cpage',$cpage->show());
			$this->assign('action','category');
			$this->display();
		}
		
		/**
		* 标签列表
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-5-23  下午10:14:32
		*/
		function tags(){
			$tagcount = count(S('Tags'));
			$tpage = new Page($tagcount, 25);
			$tags = array_slice(S('Tags'), $tpage->firstRow,$tpage->listRows);
			$this->assign('tag',$tags);
			$this->assign('tpage',$tpage->show());
			$this->assign('action','tags');
			$this->display();
		}
		
		/**
		* 标签、分类编辑
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-5-24  上午12:16:57
		*/
		function edit(){
			$type = (!$_REQUEST['cateid'] && !$_REQUEST['tagid']) || $_REQUEST['cateid'] ? 'cate' : 'tags';
			$this->assign('cateid',$_REQUEST['cateid']);
			$this->assign('tagid',$_REQUEST['tagid']);
			$this->assign('type',$type);
			$this->assign('action','ctedit');
			$this->display();
		}
		
		/**
		* 分类、标签更新、添加到数据库
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-5-24  上午1:20:10
		*/
		function add_updata(){
			$data = array();
			$data['name'] = $_REQUEST['name'];
			$_REQUEST['type'] ? $data['pid'] = $_REQUEST['cate'] : $data['cateid'] = $_REQUEST['cid'];
			$data['uid'] = $_SESSION['uid'];
			$data['status'] = $_REQUEST['status'];
			$data['menu'] = $_REQUEST['menu'];
			$data['description'] = $_REQUEST['des'];
			$_REQUEST['cateid'] || $_REQUEST['tagid'] ? ($_REQUEST['cateid'] ? $data['id'] = $_REQUEST['cateid'] : $data['id'] = $_REQUEST['tagid']) : FALSE;
			$_REQUEST['type'] ? $data['sort'] = intval($_REQUEST['order']) : FALSE;
			$model = $_REQUEST['type'] ? 'Category' : 'Tag';
			$reid = S('Article')->add_updata($data,$model);
			$url = $_REQUEST['type'] ? U('CateTag/index',array('delcache'=>1)) : U('CateTag/tags',array('delcache'=>1));
// 			if($_REQUEST['type']){
// 				$url = U('CateTag/index',array('delcache'=>1));
// 			}else {
// 				$url = U('CateTag/index',array('delcache'=>1));
// 			}
			if($reid === FALSE){
				$this->error('操作失败！',$url);
			}else {
				$this->success('操作成功！',$url);
			}
		}
		
		/**
		* 标签、分类删除
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-5-24  上午12:16:31
		*/
		function delart(){
			$id = $_REQUEST['cateid'] ? $_REQUEST['cateid'] : $_REQUEST['tagid'];
			$model = $_REQUEST['cateid'] ? M('Category') : M('Tag');
			$reid = $model->delete($id);
			if($reid === FALSE){
				$this->error('删除失败！',U('CateTag/index'));
			}else {
				$this->success('删除成功！',U('CateTag/index',array('delcache'=>1)));
			}
		}
	}
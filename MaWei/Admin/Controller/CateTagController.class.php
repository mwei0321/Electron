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
	use Admin\Controller\InitController;
	use Library\ArticleCateTag;

	class CateTagController extends InitController{
	    protected $artCateTag,$type;
		function _init(){
			parent::_init();
            //定义标签，分类对象
			$this->artCateTag = new ArticleCateTag();

			//操作类型
			$this->type = in_array($_REQUEST['type'],['cate','tag']) ? : '';
			$this->assign('typedes',['cate'=>'分类','tag'=>'标签']);
			$this->assign('type',$this->type);
		}

		/**
		* 分类列表
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-5-23  下午10:14:08
		*/
		function index(){
		    //分类列表
		    $catelist = $this->artCateTag->getArtCateList();
            //标签列表
		    $taglist = $this->artCateTag->getArtTagList();

            $this->assign('taglist',$taglist);
			$this->assign('catelist',$catelist);
			$this->display();
		}

		/**
		* 标签列表
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-5-23  下午10:14:32
		*/
		function tags(){
			$tagcount = count(S('Tags'));
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
		    $id = intval($_REQUEST['id']);
		    if($id > 0){
		        if($this->type == 'cate'){
		            $info = $this->artCateTag->getArtCateInfo($id);
		        }elseif($this->type == 'tag'){
		            $info = $this->artCateTag->getArtTInfo($id);
		        }
                $this->assign('info',$info);
		    }
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
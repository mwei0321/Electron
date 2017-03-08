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
			$this->type = in_array($_REQUEST['type'],['cate','tag']) ? $_REQUEST['type'] : 'cate';
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

		    if($this->type == 'cate')
		        $list = $catelist;
		    else
		        $list = $taglist;

		    $this->assign('taglist',$taglist);
			$this->assign('catelist',$catelist);
			$this->assign('list',$list);
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
		            $info = $this->artCateTag->getArtTagInfo($id);
		        }
		        $this->assign('info',$info);
		    }

		    $catelist = $this->artCateTag->getArtCateList();
		    $this->assign('catelist',$catelist);
			$this->display();
		}

		/**
		* 分类、标签更新、添加到数据库
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-5-24  上午1:20:10
		*/
		function addupdata(){
			$data = array();
			$data['name'] = $_REQUEST['name'];
			$data['status'] = intval($_REQUEST['status']);
			$data['sort'] = intval($_REQUEST['sort']);
			$data['description'] = text($_REQUEST['description']);
			intval($_REQUEST['id']) && $data['id'] = intval($_REQUEST['id']);

			if($_REQUEST['type'] == 'cate'){
				$data['pid'] = intval($_REQUEST['pid']);
				$model = 'ArticleCategory';
				$url = U('CateTag/index',array('delcache'=>1,'type'=>'cate'));
			}elseif($_REQUEST['type'] == 'tag'){
				$data['cate_id'] = intval($_REQUEST['cateid']);
				$model = 'ArticleTag';
				$url = U('CateTag/index',array('delcache'=>1,'type'=>'tag'));
			}
			$reid = addUpdata($data, $model);
            //return
			$rearray = [
				'reCode' => 200,
				'msg'	 => 'success!',
			    'emsg'   => 'error!'
			];
            echo json_encode($rearray);
		}

		/**
		* 标签、分类删除
		* @author MaWei (http://www.phpyrb.com)
		* @date 2014-5-24  上午12:16:31
		*/
		function delete(){
			$id = $_REQUEST['ids'];
			$model = $this->type == 'cate' ? M('ArticleCategory') : M('ArticleTag');
			$reid = $model->delete($id);
			echo intval($reid);
		}
	}
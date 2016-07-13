<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  文章控制器
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年6月5日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Admin\Controller;
    use Admin\Controller\InitController;
    use Vendor\Page;
    use Library\Article;
    use Library\ArticleCateTag;
    use Library\Edit;

    class ArticleController extends InitController{
        private $Article,$ArtCateTag;
        private $pagenum = 20;

        function _init(){
            parent::_init();
            $this->Article = new Article();
            $this->ArtCateTag = new ArticleCateTag();

            //页面条数
            intval($_REQUEST['pn']) && $this->pagenum = intval($_REQUEST['pn']);
        }

        /**
         * 文章列表
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-5-23  上午12:02:49
         */
        function index(){
            $where = [];

            //文章列表
            $count = $this->Article->getArtList($where);
            $page = new Page($count, $this->pagenum);
            $list = $this->Article->getArtList($where,"$page->firstRow,$page->listRows");

            //文章标签
            $tag = $this->ArtCateTag->getArtTagList();
            //文章分类
            $cate = $this->ArtCateTag->getArtCateList();
//             var_dump($cate);

            $this->assign('list',$list);
            $this->assign('catelist',$cate);
            $this->assign('taglist',$tag);
            $this->assign('page',$page->show());
            $this->display();
        }

        /**
         * 文章添加修改页面
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-5-23  上午12:01:35
         */
        function edit(){
            if($_REQUEST['artid']){
                $artinfo = $this->Article->getArtInfo($_REQUEST['artid']);
// 				dump($artinfo);exit;
                $this->assign('info',$artinfo);
            }

            //文章分类
            $catelist = $this->ArtCateTag->getArtCateList();

            $this->assign('catelist',$catelist);
            $this->display();
        }

        /**
         * 编辑器
         * @return array
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-9-22  下午11:11:05
         */
        function editer(){
            $editer = new Edit();
            echo $editer->output();
        }

        /**
         * 文章添加修改入数据库
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-5-23  上午12:01:56
         */
        function addupdata(){
            $data = array();
            $temp = array();
            $_REQUEST['artid'] ? $data['id'] = $_REQUEST['artid'] : FALSE;
            $data['title'] = $_REQUEST['title'];
            $data['uid'] = $this->uid;
            $data['cateid'] = $_REQUEST['cate'];
            $data['author'] = $_REQUEST['author'];
            $data['keyword'] = $_REQUEST['keyword'];
            $data['status'] = $_REQUEST['status'];
            $data['tags'] = implode(',', $_REQUEST['tags']);
            $_REQUEST['artid'] ? $data['uptime'] = time() : $data['uptime'] = $data['addtime'] = time();
            //判断文章是添加还是更新
            $_REQUEST['artid'] ? FALSE : $temp['types'] = $data['types'] = 'ad';
            $artid = $this->Article->add_updata($data);
            if($artid === FALSE){
                $this->error('更新失败！',U('Article/edit',array('artid'=>$_REQUEST['artid'])));
            }else {
                $temp['artid'] = $_REQUEST['artid'] ? $_REQUEST['artid'] : $artid;
                $temp['description'] = $_REQUEST['description'];
                $temp['content'] = $_REQUEST['content'];
                $ret = $this->Article->add_updata($temp,'Content','artid');
                if($ret === FALSE){
                    $this->error('文章内容更新失败',U('Article/edit',array('artid'=>$_REQUEST['artid'])));
                }else {
                    $this->success('文章添加修改成功！',U('Article/index'));
                }
            }

        }

        /**
         * 文章删除
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-5-23  上午12:02:28
         */
        function delart(){
            $artid = $_REQUEST['artid'];
            $reid = M('Article')->delete($artid);
            if($reid === FALSE){
                $this->error('删除失败！',U('Article/index'));
            }else {
                $reid = M('Content')->where(array('artid'=>$artid))->delete();
                if($reid === FALSE){
                    $this->error('删除失败！',U('Article/index'));
                }else {
                    $this->success('删除成功！',U('Article/index'));
                }
            }
        }
    }
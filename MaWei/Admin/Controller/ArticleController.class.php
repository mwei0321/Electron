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
	*   知识的传承源于无私的人的记录！
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Admin\Controller;
    use Admin\Controller\InitController;
    use Vendor\Page;
    use Library\Article;
    use Library\ArticleCateTag;

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
            //条件处理
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
            //文章标签
            $taglist = $this->ArtCateTag->getArtTagList(['status'=>1]);

            $this->assign('catelist',$catelist);
            $this->assign('taglist',$taglist);
            $this->display();
        }



        /**
         * 文章添加修改入数据库
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-5-23  上午12:01:56
         */
        function addupdata(){
            //condition
            $id = intval($_REQUEST['id']);
            $data = array();
            $temp = array();
            $data['title'] = $_REQUEST['title'];
            $data['uid'] = $this->uid;
            $data['cateid'] = $_REQUEST['cateid'];
            $data['author'] = 1;
            $data['keyword'] = $_REQUEST['keyword'];
            $data['status'] = intval($_REQUEST['status']) ? : ($id ? intval($_REQUEST['status']) : 1);
            $data['tags'] = implode(',', $_REQUEST['tags']);
            $id && $data['id'] = $id;
            $id ? $data['uptime'] = time() : $data['uptime'] = $data['ctime'] = time();
            //write article baseinfo database
            $artid = addUpdata($data,'Article');
            //write article content
            $temp['artid'] = $id ? : $artid;
            $temp['description'] = $_REQUEST['description'];
            $temp['content'] = $_REQUEST['content'];

            $upfield = $id ? 'artid' : '';
            $ret = addUpdata($temp,'ArticleContent',$upfield);

            //return
            $rearray = [
                'reCode' => $ret === FALSE ? -1 : 200,
                'msg'	 => 'success!',
                'emsg'   => 'error!',
            ];
            echo json_encode($rearray);
        }

        /**
         * 文章删除
         * @author MaWei (http://www.phpyrb.com)
         * @date 2014-5-23  上午12:02:28
         */
        function delete(){
            $id = $_REQUEST['ids'];
            $reid = M('ArticleContent')->where(['artid'=>['IN',$id]])->delete();
            $reid = M('Article')->delete($id);
            echo intval($reid);
        }
    }
<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  文章展示
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年7月19日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Blog\Controller;
    use Blog\Controller\InitController;
    use Library\Article;
    use Vendor\Page;

    class ArticleController extends InitController{
        private $Article;
        function _init(){
            parent::_init();
            //init article class
            $this->Article = new Article();
            //获取最热文章
            $topArt = $this->Article->getTopArt();
            $this->assign('topArt',$topArt);
        }

        /**
         * 文章列表页
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月22日 上午10:11:51
        */
        function index(){
            //condition
            $keyword = text($_REQUEST['keyword']);
            $cateid = intval($_REQUEST['cid']);
            $tagid = intval($_REQUEST['tid']);
            $keyword && $where[] = " a.`title` LIKE '%$keyword%' ";
            $cateid && $where[] = " a.`cateid` = $cateid ";
            $tagid && $where[] = " FIND_IN_SET($tagid,'tags') ";
            $where = implode(' AND ', $where);

            //get article count
            $count = $this->Article->getArtInfoList($where);
            //page
            $page = new Page($count, 12);
            //list
            $artlist = $this->Article->getArtInfoList($where,"$page->firstRow,$page->listRows");
            //var_dump($artlist);

            $this->assign('artlist',$artlist);
            $this->display();
        }

        /**
         * 文章详情
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月22日 上午10:24:47
        */
        function info(){
            $artid = intval($_REQUEST['artid']);

            $info = $this->Article->getArtInfo($artid);
            //增加查看数
            M('Article')->where(['id'=>$artid])->setInc('hots');

            $this->assign('info',$info);
            $this->display();
        }
    }
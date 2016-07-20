<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain: blog 主页
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

    class IndexController extends InitController{
        private $Article;
        function _init(){
            parent::_init();

            //init article class
            $this->Article = new Article();
        }

        function index(){
            //condition
            $where = [];
            $_REQUEST['keywords'] && $where['keywords'] = ['LIKE','%'.text($_REQUEST['keywords']).'%'];

            //get article count
            $count = $this->Article->getArtInfoList($where);
            //page
            $page = new Page($count, 12);
            //list
            $artlist = $this->Article->getArtInfoList($where,"$page->firstRow,$page->listRows");
//             var_dump($artlist);

            $this->assign('artlist',$artlist);
            $this->display();
        }
    }
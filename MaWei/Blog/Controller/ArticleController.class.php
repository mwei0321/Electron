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
	*   马伟，男，1988年出生于湖南。入IT行业以来，先后在几家公司担任过项目组长，负责公司项目的一部份模块，熟悉企业站、商城站、社区站等各种类型的网站的组建、维护，对网站的服务器端到网站程序代码编写到前台的页面展示都精通。对网站的稳定，流量负载均衡，代码的优化都有很丰富的经验。熟悉目前一些主流的PHP框架。主要掌握的技术有。Debian、Nginx、PHP、Mysql、Apache、HTML、CSS、JS、Python等。
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Blog\Controller;
    use Blog\Controller\InitController;
    use Library\Article;
    use Vendor\Page;
    use Library\ArticleCateTag;

    class ArticleController extends InitController{
        private $Article;
        function _init(){
            parent::_init();
            //init article class
            $this->Article = new Article();
            //热门文章
            $this->_hotsArt();
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
            $catepid = intval($_REQUEST['pid']);
            //父分类搜索
            if($catepid > 0){
                $cateids = (new ArticleCateTag())->getSubCateByPid($catepid);
                $cateids[] = $catepid;
                $where[] = " a.`cateid` IN(".implode(',', $cateids).") ";
            }
            $keyword && $where[] = " a.`title` LIKE '%$keyword%' ";
            $cateid && $where[] = " a.`cateid` = $cateid ";
            $tagid && $where[] = " FIND_IN_SET($tagid,`tags`) ";
            $where = implode(' AND ', $where);

            //get article count
            $count = $this->Article->getArtInfoList($where);
            //page
            $page = new Page($count, 8);
            //list
            $artlist = $this->Article->getArtInfoList($where,"$page->firstRow,$page->listRows");
            //var_dump($artlist);

            $this->assign('artlist',$artlist);
            $this->assign('page',$page->show());
            $this->display();
        }

        /**
         * 文章详情
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月22日 上午10:24:47
        */
        function info(){
            $artid = intval($_REQUEST['aid']);

            $info = $this->Article->getArtInfo($artid);
            //增加查看数
            M('Article')->where(['id'=>$artid])->setInc('hots');

            $this->assign('info',$info);
            $this->display();
        }

        //热门文章
        private function _hotsArt(){
            //获取最热文章
            if(!C('TopArt')){
                $topArt = $this->Article->getTopArt();
                C('TopArt',$topArt,1800);
            }
            $this->assign('topArt',C('TopArt'));
            //分类下的文章数
            if(!C('CateArtNum')){
                $cateArtNum = $this->Article->getCateArtNum();
                C('CateArtNum',$cateArtNum);
            }
            $this->assign('cateArtNum',C('CateArtNum'));
        }
    }
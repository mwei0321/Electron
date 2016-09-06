<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  教程文章操作
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年8月8日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Admin\Controller;
    use Admin\Controller\InitController;
    use Library\Tutorial;
    use Vendor\Page;
    use Library\ArticleCateTag;

    class TutorialController extends InitController{
        private $pnum = 20;
        private $tutorial;
        function _init(){
            parent::_init();

            //实例教程模型
            $this->tutorial = new Tutorial();

            //实例文章分类模型
            $cateObj = new ArticleCateTag();
            $catelist = $cateObj->getArtCateList();
            $this->assign('catelist',$catelist);
        }

        /**
         * 教程文章列表
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月8日 上午11:38:23
        */
        function index(){
            //condition
            $where = [];

            //count
            $count = $this->tutorial->getTutorialList($where);
            if($count > 0){
                $page = new Page($count, $this->pnum);
                $list = $this->tutorial->getTutorialList($where,"$page->firstRow,$page->listRows");
            }else
                $list = [];

            $this->assign('list',$list);
            $this->display();
        }


        /**
         * 教程文章步骤列表
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月10日 下午2:23:37
        */
        function directory(){
            $artid = intval($_REQUEST['artid']);

            $list = $this->tutorial->getTutorialDirectory($artid);
            var_dump($list);
        }

        /**
         * 教程相关编辑页
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月8日 上午11:40:11
        */
        function edit(){
            $type = $_REQUEST['type'];
            $artid = intval($_REQUEST['artid']);
            $directory_id = intval($_REQUEST['dir_id']);

            switch ($type){
                case 'tutorial':
                    if($artid > 0)
                        $info = $this->tutorial->getTutorialInfo($artid);
                        echo '<span></span>';
//                         var_dump($info);
                    $template = 'tutorialedit';
                    //教程文章列表
                    $tutorial = $this->tutorial->getTutorialList(['status'=>1],null);
                    $this->assign('tutorial',$tutorial);
                    break;
            }

            $this->assign('info',$info);
            $this->display($template);
        }

        /**
         * 教程相关数据写入
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月8日 下午12:02:20
        */
        function addupdata(){
            $type = $_REQUEST['type'];
            $id = intval($_REQUEST['id']);

            $data = [];
            switch ($type){
                case 'tutorial':
                    $id && $data['id'] = $id;
                    $data['cateid'] = intval($_REQUEST['cateid']);
                    $data['title'] = text($_REQUEST['title']);
                    $data['keyword'] = text($_REQUEST['keyword']);
                    $data['description'] = text($_REQUEST['description']);
                    $data['content'] = $_REQUEST['content'];
                    $reid = addUpdata($data, 'ArticleTutorial');
                    $reid === false && $this->reCode = 430;
                    break;
            }

            $this->_reCode();
        }
    }

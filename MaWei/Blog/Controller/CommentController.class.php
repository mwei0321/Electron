<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  评论操作
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年9月12日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Blog\Controller;
    use Blog\Controller\InitController;

    class CommentController extends InitController{

        function _init(){
            parent::_init();
        }

        function index() {


        }

        /**
         * 文章评论
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年9月12日 下午8:49:18
        **/
        function artComment(){
            $artid = intval($_REQUEST['aid']);
        }
    }

<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain: 项目入口初始化
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年7月19日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Blog\Controller;
    use Think\Controller;
    use Library\ArticleCateTag;

    class InitController extends Controller{
        protected $catelist,$taglist;
        function _init(){
            //分类列表
            $this->_getCate();
            //标签列表
            $this->_getTag();
        }

        /**
         * 获取文章分类
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月19日 下午5:00:26
        */
        private function _getCate(){
            $cate = new ArticleCateTag();
            $catelist = $cate->getArtCateList();
            $this->assign('catelist',$catelist);
            $this->catelist = $catelist;
        }

        /**
         * 获取文章标签
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月19日 下午5:02:26
        */
        private function _getTag(){
            $tag = new ArticleCateTag();
            $taglist = $tag->getArtTagList();
            $this->assign('taglist',$taglist);
            $this->taglist = $taglist;
        }

    }
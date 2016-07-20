<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  文章分类、标签操作模型
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年6月5日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Library;

    class ArticleCateTag{
        private $cate,$tag;

        function __construct(){
            $this->catetag = M('ArticleCategory');
            $this->tag = M('ArticleTag');
        }

        /**
         * 获取文章分类
         * @param  array $_where
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年6月9日 下午9:02:23
        */
        function getArtCateList($_where = []){
            $list = $this->catetag->where($_where)->select();
            $list = level($list);
            return $list;
        }

        /**
         * 获取文章标签
         * @param  array $_where
         * @return array $list
         * @author MaWei (http://www.phpython.com)
         * @date 2016年6月9日 下午9:11:29
        */
        function getArtTagList($_where = []){
            $list = $this->tag->where($_where)->select();
            return fieldtokey($list);
        }

        /**
         * 获取分类详情
         * @param  int $_id
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年6月11日 下午8:29:39
        */
        function getArtCateInfo($_id){
            $info = M('ArticleCategory')->where(['id'=>$_id])->find();
            return $info;
        }

        /**
         * 获取标签详情
         * @param  int $_id
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年6月11日 下午8:36:51
        */
        function getArtTagInfo($_id){
            $info = M('ArticleTag')->where(['id'=>$_id])->find();
            return $info;
        }
    }
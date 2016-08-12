<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  教程文章操作模型
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年8月8日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Library;

    class Tutorial{

        function __construct(){

        }

        /**
         * 教程文章列表
         * @param  array $_where
         * @param  string $_limit
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月8日 上午11:40:42
        */
        function getTutorialList($_where = [],$_limit = 'count'){
            $m = M('ArticleTutorial');
            if($_limit == 'count'){
                $count = $m->where($_where)->count();
                return $count;
            }
            $list = $m->where($_where)->order('uptime DESC')->limit($_limit)->select();
            return $list;
        }

        /**
         * 获取教程相关信息
         * @param  int $_tutorid
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月10日 上午11:04:44
        */
        function getTutorialInfo($_tutorid){
            $m = M('ArticleTutorial');
            $info = $m->where(['id'=>$_tutorid])->find();
            return $info;
        }

        /**
         * 教程文章目录
         * @param  int $_artid
         * @param  boolean $_status
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月8日 上午11:43:17
        */
        function getTutorialDirectory($_artid,$_status = null){
            $m = M('ArticleTutorialDirectory');
            $list = $m->where(['pid'=>$_artid])->select();
            $list && $list = level($list);
            return $list;
        }

        /**
         * 教程文章内容
         * @param  int $_directory_id 目录ID
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月8日 上午11:46:31
        */
        function getTutorialContent($_directory_id){
            $m = M('ArticleTutorialContent ac');
            $info = $m->join(' article_tutorial_directory ad ON ac.directory_id = ac.id')->where(['ad.directory_id'=>$_directory_id])->find();
            return $info;
        }

    }

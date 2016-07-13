<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  文章操作模型
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年6月5日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Library;

    class Article {

        function __construct(){

        }

        /**
         * 获取文章列表
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年6月21日 上午9:28:24
        */
        function getArtList($_where = [],$_limit = 'count'){
            $m = M('Article');
            if($_limit == 'count'){
                $count = $m->where($_where)->count();
                return $count;
            }
            $list = $m->where($_where)->order('uptime DESC')->limit($_limit)->select();
            return $list;
        }

        /**
         * 获取文章详情
         * @param  int  $_artid
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月8日 上午10:34:44
        */
        function getArtInfo($_artid){
            $sql = "SELECT * FROM `article` a LEFT JOIN `article_content` ac ON a.`id`=ac.`artid` WHERE a.`id`=".$_artid." LIMIT 1";
            $info = M()->query($sql);
            return array_shift($info);
        }
    }
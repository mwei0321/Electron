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
         * 获取文章详情列表
         * @param  array $_where 条件
         * @param  string $_page 分页
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月19日 下午4:39:55
        */
        function getArtInfoList($_where = '',$_page = 'count'){
            $filed = "*";
            $sql = "SELECT $filed FROM `article` a LEFT JOIN `article_content` ac ON a.`id`=ac.`artid` WHERE a.`status` = 1";
            $_where && $sql .= ' AND '.$_where;
            //count
            if($_page == 'count'){
                $filed = 'COUNT(a.`id`) `num`';
                $sql = "SELECT $filed FROM `article` a WHERE a.`status` = 1";
                $count = M()->query($sql);
                return $count[0]['num'];
            }

            //list
            $sql .= ' ORDER BY `uptime` DESC LIMIT '.$_page;
            $list = M()->query($sql);

            //tag array
            foreach ($list as $k => $v){
                $list[$k]['tagids'] = explode(',', $v['tags']);
            }

            return $list;
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
            //tag array
            foreach ($list as $k => $v){
                $list[$k]['tagids'] = explode(',', $v['tags']);
            }

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

        /**
         * 获取最热的文章
         * @param  int $_toptype 1.为点击数 2.评论数
         * @param  int $_num
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年7月22日 下午2:46:20
        */
        function getTopArt($_toptype = 1,$_num = 15){
            $order = $_toptype == 1 ? '`hots` DESC' : '`com_num` DESC';
            $list = M('Article')->where(['status'=>1])->order($order)->limit($_num)->select();
            return $list;
        }

        /**
         * 返回分类下的文章数
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年9月12日 下午8:34:02
        **/
        function getCateArtNum(){
            $sql = "SELECT COUNT('id') num,cateid FROM `article` WHERE `status` = 1 GROUP BY `cateid`";
            $num = M()->query($sql);
            return fieldtokey($num,'cateid');
        }
    }
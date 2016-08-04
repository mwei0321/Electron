<?php
   /**
	*  +----------------------------------------------------------------------------------------------+
	*   | Explain:  前台配置
	*  +----------------------------------------------------------------------------------------------+
	*   | Author: MaWei <1123265518@qq.com>
	*  +----------------------------------------------------------------------------------------------+
	*   | Creater Time : 2016年8月3日
	*  +----------------------------------------------------------------------------------------------+
	*   | Link :		http://www.phpython.com
	*  +----------------------------------------------------------------------------------------------+
	**/

    namespace Library;

    class WebConf {

        function __construct(){

        }


        /**
         * 获取导航菜单
         * @param  array $_where
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月3日 上午9:25:30
        */
        function getHomeNaviMenu($_where = []){
            $m = M('WebNaviMenu');
            $list = $m->where($_where)->order('sort DESC')->select();
            //层级处理
            $list = level($list);
            return $list;
        }

        /**
         * 获取导航菜单详情
         * @param  int $_id
         * @return array
         * @author MaWei (http://www.phpython.com)
         * @date 2016年8月3日 上午9:32:35
        */
        function getNaviMenuInfo($_id){
            $info = M('WebNaviMenu')->where(['id'=>$_id])->find();
            return $info;
        }
    }
